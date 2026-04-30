---
description: Command to generate a PR description using code analysis
agent: build
model: opencode/minimax-m2.5-free
---

# Execution
1. Determine the base branch: check `git remote show origin` or fall back to `develop|dev`, then `main`.
2. Run `git diff --stat $(git merge-base HEAD <base>)..HEAD` to get the files changed.
3. Run `caveman-review` on `git diff $(git merge-base HEAD <base>)..HEAD` to summarize key logic changes and potential risks.
4. Infer a concise PR title from the commit log (`git log --oneline $(git merge-base HEAD <base>)..HEAD`) and `$ARGUMENTS` if provided.
5. Generate the PR with GitHub CLI:

```sh
gh pr create --base <base> --title "<inferred title>" --body "$(cat <<'EOF'
## Summary
[Summarize the intent of these changes in 2–3 sentences]

## Key Changes
[Bullet points from caveman-review — logic changes, notable decisions, refactors]

## Risks & Notes
[Potential side effects, breaking changes, or areas needing extra review — from caveman-review]

## Files Changed
[Output of git diff --stat]
EOF
)"
```

# Notes
- If `$ARGUMENTS` is non-empty, use it to sharpen the title and summary.
- If the repo has a `.github/pull_request_template.md`, use that structure instead of the template above.
- Do not open a draft PR unless the user asks.
