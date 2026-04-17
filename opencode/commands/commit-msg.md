---
description: Analyze staged changes and commit following Conventional Commits
agent: build
model: opencode/big-pickle
---
Load `caveman` skill (ultra mode) once at start.

Conventional Commits: `<type>(<scope>): <desc>` — imperative, ≤72 chars, no period. Types: feat/fix/docs/style/refactor/test/chore/perf/ci/build/revert. Body only if why isn't obvious.

On "commit": ALWAYS run `git diff --staged` first — never assume state from previous checks.

Never: git add, git push, multiple diff calls, load caveman-commit skill, re-load caveman if already active.
