---
description: Group changes into semantic commits and push
agent: build
model: opencode/minimax-m2.5-free
---

Group all current changes into meaningful semantic commits and push the current branch.

Optional context for commit messages: `$ARGUMENTS`

# Inspect Repository State
Run all of these before planning anything:
- `git status --short`
- `git diff --stat`
- `git diff`
- `git stash list`
- `git log --oneline -10`

# Safety Checks
Before doing anything else:
- If any staged or unstaged file looks sensitive (`.env`, `*.key`, `*.pem`, tokens, secrets, credentials) — **stop and ask the user** before proceeding.
- If the current branch is `main` or `master` — warn the user and confirm before pushing.
- Do not use `--no-verify`, `--force`, `--amend`, or revert any existing changes.

# Grouping Rules
- Identify related file groups by intent: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `ci`, or `config`.
- Each commit should contain only files that share the same intent. Never mix unrelated changes.
- If `$ARGUMENTS` is non-empty, use it as context to sharpen commit messages — but only if it accurately reflects the changes.
- Follow the commit style from `git log --oneline -10`.
- Include a scope when the change is clearly scoped to a module, package, directory, or feature: `type(scope): message`. Infer the scope from the file paths or `$ARGUMENTS`. Omit it only when the change is truly cross-cutting.

# Commit Plan
1. Show the full proposed plan: each group, its commit message, and the files it includes.
2. If grouping is unambiguous, proceed. If there is real uncertainty about intent, ask before committing.

# Execution
For each group in order:
1. `git add <files>` — only the files for that group.
2. `git commit -m "<semantic message>"`.

After all commits:
3. `git push`

# Summary
List each commit created (hash + message) and the branch that was pushed.
