---
description: Generate a commit message using caveman-commit and conventional commit rules
agent: build
model: opencode/big-pickle
---

# Execution
1. Use the `caveman-commit` skill to analyze the current staged changes.
2. Ensure the output follows the Conventional Commits specification below.

# Conventional Commits Rules
Format: <type>[optional scope]: <description>

Allowed Types:
- feat, fix, docs, style, refactor, test, chore, perf, ci, build, revert

Requirements:
- Start with an allowed type.
- Use imperative mood (e.g., "add" not "adds").
- Length must be less than 100 characters.
- Match regex: ^(feat|fix|docs|style|refactor|test|chore|perf|ci|build|revert)(\(.+\))?: .+

# Final Action
Call `caveman-commit` with these constraints to generate and suggest the commit message.
