import Foundation

enum TerminalServiceError: LocalizedError {
    case failedToOpen(underlying: Error)

    var errorDescription: String? {
        switch self {
        case .failedToOpen(let underlying):
            return "Couldn't open Terminal: \(underlying.localizedDescription)"
        }
    }
}

class TerminalService {
    func openShell(containerName: String) throws {
        let escapedName = containerName.replacingOccurrences(of: "\"", with: "\\\"")
        let dockerCommand = "docker exec -it \(escapedName) bash || docker exec -it \(escapedName) sh"
        let escapedCommand = dockerCommand.replacingOccurrences(of: "\"", with: "\\\"")

        let script = """
        tell application "Terminal"
            do script "\(escapedCommand)"
            activate
        end tell
        """

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", script]

        do {
            try process.run()
        } catch {
            throw TerminalServiceError.failedToOpen(underlying: error)
        }
    }
}
