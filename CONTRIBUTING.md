# Contributing to DocMonitor

Thanks for your interest in DocMonitor! This page explains how you can help and, just as important, what the license does and does not allow.

> A Spanish translation is available in [CONTRIBUTING.es.md](CONTRIBUTING.es.md). If the two versions differ, the English one prevails.

## Read this first: the license

DocMonitor is released under the [PolyForm Strict License 1.0.0](LICENSE). It is **source-available**, not open source. In short:

- You **may** read the code and use the app for noncommercial purposes.
- You **may not** distribute it, modify it or use it commercially without the author's permission.

This is why code contributions work differently from a typical open-source project. See [Code contributions](#code-contributions) below.

## Ways you can help

### Report bugs

Open an issue and include as much of this as you can:

- DocMonitor version (shown in the app bundle's info) and where you got it.
- macOS version and Mac type (Apple silicon or Intel).
- Docker engine and version (Docker Desktop, Colima, OrbStack, etc.).
- Steps to reproduce, what you expected and what happened instead.
- Screenshots or error messages, if any.

Please search the existing issues first, and remove anything sensitive (container names, environment variables, registry credentials) before posting.

### Suggest features or improvements

Open an issue and describe the problem you want to solve before proposing a solution. Suggestions are welcome, but the author decides what fits the project and there is no guarantee that a suggestion will be implemented.

### Test and give feedback

Trying DocMonitor on different setups (other Docker engines, other Mac models, other macOS 26 versions) and reporting what works and what does not is very valuable.

### Improve the documentation

Typos, unclear steps and missing information in the README or in this file are welcome as issues. Translations follow the same rules as code contributions below.

### Spread the word

Starring the repository and linking to it or to the [latest release](https://github.com/cessadev/docmonitor/releases/latest) helps a lot. Please link to the release instead of re-uploading the app (see [What is not allowed](#what-is-not-allowed)).

## Code contributions

The license does not allow modifying the software by default, so code contributions are handled as follows:

1. **Open an issue first** and wait for the author to agree with the change. Please do not send a pull request that was not discussed beforehand.
2. **Permission to prepare the contribution.** Once the change is agreed, you may make a private copy of the repository (for example, a fork on GitHub) and modify it **only** to prepare that contribution. This permission does not let you publish or distribute your modified copy for any other purpose than your fork on GitHub and the pull request to this repository.
3. **Your contribution.** By opening a pull request you confirm that:
   - you wrote it, or you have the right to submit it, and it does not include code under terms that conflict with this project's license or with the rights of your employer;
   - you keep the copyright of your contribution, and you grant the author a perpetual, worldwide, irrevocable, royalty-free and non-exclusive license to use, copy, modify, distribute and sublicense it as part of DocMonitor, under the current license or any future license.
4. **The author decides.** Any contribution may be accepted, changed or declined. Accepted contributions are distributed as part of DocMonitor under its license.

### Guidelines for pull requests

- Build with Xcode 26 or later (see [Build from source](README.md#build-from-source)) and check that the app builds and runs.
- Keep each pull request focused on one change.
- Follow the style of the surrounding Swift and SwiftUI code and the existing folder structure (`App`, `Core`, `Features`, `UI`).
- Use short commit messages that start with a prefix such as `add:`, `fix:` or `improve:`, like the existing history.
- Explain what the change does and how you tested it.

## What is not allowed

Without the author's written permission, you may not:

- Redistribute DocMonitor, in source or built form. That includes re-uploading release builds, mirrors, and bundling it into other products or package repositories.
- Publish modified versions of DocMonitor or releases built from your fork.
- Use DocMonitor for commercial purposes, for example as part of a paid product or service.
- Remove or change the license notices.

GitHub lets anyone fork a public repository on GitHub. That is a feature of the platform and does not grant any additional license to use the fork elsewhere.

## Commercial use and other permissions

If you want to use DocMonitor commercially, package it, redistribute it, or do anything else the license does not cover, open an issue titled **"Permission request"** explaining what you have in mind. The author may grant permission case by case.

## Be respectful

Please be kind and constructive in issues and pull requests. Reports and comments that are abusive or off-topic may be closed or removed.
