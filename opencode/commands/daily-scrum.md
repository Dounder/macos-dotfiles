---
description: Command to generate a daily scrum update in Spanish
agent: build
model: opencode/big-pickle
---

# Execution
1. Identify the current git user from `git config user.name`.
2. Use the `caveman-review` skill to analyze recent commits (`git log --oneline -5`) and changes (`git diff --stat HEAD~1`).
3. Generate a concise update in Spanish using the format below.

# Output Format
**Ayer:** [Acción concreta] + [Resultado/Estado]
**Hoy:** [Siguiente paso] + [Objetivo/Impacto]
**Bloqueos:** [Sí/No] → [Descripción breve si los hay] + [Qué necesitas]

# Output Rules
- Language: Spanish
- Tone: Brief and direct
- Context: If $ARGUMENTS provided, include as additional context