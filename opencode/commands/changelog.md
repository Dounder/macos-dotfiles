---
description: Command to generate/edit a changelog for a project
agent: build
model: opencode/minimax-m2.5-free
---

# Execution
1. Determine the next version (X.Y.Z) by checking the latest git tag (`git describe --tags --abbrev=0`) and inferring a bump from the staged changes, or ask the user if ambiguous.
2. Search for `.agents/instructions/changelog.instructions.md`. If not found, fall back to standard Keep a Changelog format.
3. Run `git diff $(git describe --tags --abbrev=0)..HEAD` to get the diff since the last tag.
4. Use `caveman-review` on that diff to identify notable changes.
5. Format the changes per the instructions file under the version heading `## [X.Y.Z] - YYYY-MM-DD`.
6. Save to `CHANGELOG.md` (or `changelog.md` if it already exists with that casing).

# Git Actions
1. Use `caveman-commit` to stage and commit `CHANGELOG.md` with: `chore(changelog): update changelog for vX.Y.Z`.
2. Create an annotated tag: `git tag -a vX.Y.Z -m "Release vX.Y.Z"`.
3. Push branch and tags: `git push origin HEAD --tags`.
