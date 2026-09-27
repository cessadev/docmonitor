import Foundation
import AppKit
import UniformTypeIdentifiers

@Observable
class ComposeViewModel {

    var projects: [DockerComposeProject] = []
    var error: String?
    var isLoadingProjectId: UUID?
    
    // Internal Compose project name being stopped — matches com.docker.compose.project label
    var lockedComposeProject: String? {
        guard let loadingId = isLoadingProjectId,
              let project   = projects.first(where: { $0.id == loadingId }) else {
            return nil
        }
        return project.displayName.lowercased()
    }
    
    // Project names currently running — containers belonging to these should not be deleted
    var activeComposeProjects: Set<String> {
        Set(
            projects
                .filter { $0.overallStatus == .running || $0.overallStatus == .partial }
                .map { $0.displayName.lowercased() }
        )
    }
    
    private var manualPaths = Set<String>()

    private let composeService = ComposeService.shared

    private func performBlocking<T: Sendable>(_ work: @escaping @Sendable () -> T) async -> T {
        await Task.detached(priority: .userInitiated, operation: work).value
    }

    @MainActor
    func refresh() async {
        let snapshot = projects
        let service  = composeService

        let updated: [DockerComposeProject] = await performBlocking {
            var result = snapshot
            DispatchQueue.concurrentPerform(iterations: result.count) { index in
                result[index].serviceStatuses = service.refreshStatus(for: result[index])
            }
            return result
        }

        let statusesByPath = Dictionary(updated.map { ($0.filePath, $0.serviceStatuses) }, uniquingKeysWith: { _, latest in latest })
        for index in projects.indices {
            if let statuses = statusesByPath[projects[index].filePath] {
                projects[index].serviceStatuses = statuses
            }
        }
    }

    @MainActor
    func up(_ project: DockerComposeProject) async {
        isLoadingProjectId = project.id
        error = nil
        NSApp.setActivationPolicy(.regular)

        let service = composeService
        let failure: String? = await performBlocking {
            do { try service.up(project: project); return nil }
            catch { return error.localizedDescription }
        }
        if let failure { error = failure }

        try? await Task.sleep(nanoseconds: DockerSettleDelay.composeUp)
        NSApp.setActivationPolicy(.accessory)
        await refresh()
        isLoadingProjectId = nil
    }

    @MainActor
    func down(_ project: DockerComposeProject) async {
        isLoadingProjectId = project.id
        error = nil

        let service = composeService
        let failure: String? = await performBlocking {
            do { try service.down(project: project); return nil }
            catch { return error.localizedDescription }
        }
        if let failure { error = failure }

        try? await Task.sleep(nanoseconds: DockerSettleDelay.composeDown)
        await refresh()
        isLoadingProjectId = nil
    }
    
    @MainActor
    func remove(_ project: DockerComposeProject) {
        projects.removeAll { $0.id == project.id }
        manualPaths.remove(project.filePath)
    }

    // Add a project manually via file picker
    @MainActor
    func addManualProject() {
        let panel = NSOpenPanel()
        panel.title                 = "Select a Compose file"
        panel.allowedContentTypes   = [.yaml]
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories  = false
        panel.canChooseFiles        = true

        // Bring the app to front so the panel gets proper focus
        NSApp.activate(ignoringOtherApps: true)

        panel.begin { [weak self] response in
            guard let self,
                  response == .OK,
                  let url = panel.url else { return }

            let project = DockerComposeProject(
                name: url.deletingLastPathComponent().lastPathComponent,
                filePath: url.path
            )

            // Avoid duplicates
            guard !self.manualPaths.contains(url.path) else { return }
            self.manualPaths.insert(url.path)

            Task { @MainActor in
                var enriched = project
                enriched.serviceStatuses = self.composeService.refreshStatus(for: project)
                self.projects.append(enriched)
                self.projects.sort { $0.displayName.lowercased() < $1.displayName.lowercased() }
            }
        }
    }
}
