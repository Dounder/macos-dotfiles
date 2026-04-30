---
description: Command to generate a list of tasks based on the git commit history
agent: build
model: opencode/minimax-m2.5-free
---

# Execution
1. Identify the current git user: `git config user.name` and `git config user.email`.
2. Define the date range:
   - If `$ARGUMENTS` contains a date or range, use that instead.
   - Otherwise, default to the current week: Monday 00:00 to today 23:59.
3. Fetch commits by this user in that range:
   `git log --all --oneline --author="<email>" --after="<start>" --before="<end>"`
4. Use `caveman-review` on the commit list to group related commits and eliminate duplicates or noise (e.g. merge commits, version bumps, typo fixes).
5. Summarize each meaningful group into one concise task.

# Output Rules
- Format: Unordered Markdown list — nothing else, no headers, no preamble.
- Language: Spanish.
- Tense: Infinitive (e.g., "Crear un endpoint..." not "Crea..." or "Creó...").
- Granularity: One task per logical change, not one per commit.
- Omit noise: skip merge commits, changelog updates, and dependency bumps unless they are the only changes.

# Task Examples
- Crear un endpoint para la creación de usuarios.
- Agregar middleware de autenticación.
- Corregir validación en el formulario de registro.
- Migrar base de datos para soporte de múltiples roles.
