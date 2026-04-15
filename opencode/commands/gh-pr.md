---
description: Command to generate a PR description using code analysis
agent: build
model: opencode/big-pickle
---

# Execution
1. Identify the branches to compare (usually `develop...HEAD`).
2. Run `caveman-review` on the branch diff to summarize key logic changes and potential risks.
3. Use the summary from the skill to populate the "Changes" section below.

# PR Template
Generate the PR using GitHub CLI:
gh pr create --base develop --title "Your Title" --body "$(cat <<'EOF'
## Summary
[Summarize the intent of these changes]

## Key Changes (Analyzed by Caveman)
[Insert bullet points from caveman-review here]

## Files Changed
[Use git diff --stat]
EOF
)"
