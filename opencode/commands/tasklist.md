---
description: Command to generate a list of tasks based on the git commit history
agent: build
model: opencode/big-pickle
---

# Execution
1. Identify the current git user from `git config user.name`.
2. Define the date range: from the last day of the previous week to the last day of the current week.
3. Use the `caveman-review` skill to analyze all commits made by this user within that date range.
4. Summarize each commit into a short, concise task.

# Output Rules
- Format: Unordered Markdown list.
- Language: Spanish.
- Tense: Present tense (e.g., "Crea un endpoint..." instead of "Created...").
- Content: Only print the Markdown list.

# Task Examples
- Crear un endpoint para la creación de usuarios.
- Agregar middleware de autenticación.
