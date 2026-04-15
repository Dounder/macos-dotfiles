---
description: Command to generate/edit a changelog for a project
agent: build
model: opencode/big-pickle
---

# Execution
1. Search for `.github/instructions/changelog.instructions.md`.
2. Use `caveman-review` on the diff between the last tag and HEAD to identify "notable changes."
3. Format the changes according to the instructions file.
4. Save to `(CHANGELOG|changelog).md`.

# Git Actions
1. Once edited, use the `caveman-commit` skill to stage and commit with: "chore(changelog): update changelog for version X.Y.Z".
2. Create the tag "Release version X.Y.Z".
3. Push: `git push origin HEAD -u --tags`.
