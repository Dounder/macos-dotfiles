---
description: Command to generate a project manual with context optimization
agent: build
model: opencode/big-pickle
---

# Pre-Analysis Optimization
1. For any source file or documentation larger than 20KB, use the `caveman-compress` skill to create a high-density summary before reading.
2. Perform the deep-dive analysis using these compressed versions to ensure no "context drifting" occurs.

# Instructions
Before writing anything, perform a **thorough deep-dive analysis** of the entire codebase. Take all the time needed — completeness is more important than speed. This includes:

- Recursively traverse every directory and file (source, config, scripts, assets, tests, CI/CD, Docker, infra)
- Read all relevant source files: modules, services, controllers, providers, routes, models, schemas, hooks, components, guards, interceptors, middleware, pipes, decorators, migrations, seeders, and any shared utilities
- Analyze all configuration files: environment files, build configs, dependency manifests, and deployment descriptors
- Identify all integrations, third-party libraries, and external services
- Map every data flow, API contract, authentication/authorization mechanism, state management pattern, and inter-module communication
- Detect architectural patterns in use (e.g. Clean Architecture, BLoC, DDD, feature-first, barrel exports, dependency injection)
- Do not skip any file — if uncertain whether something is relevant, read it

Only after completing the full scan, generate the two manuals below.

---

## Manual 1 — Technical Reference (for developers)

Target audience: developers onboarding to the project or returning after time away.

Sections to include:

1. **Project overview** — purpose, tech stack (Flutter / NestJS / Golang / Angular 19+), monorepo or multi-repo structure
2. **Architecture** — high-level diagram description, layer responsibilities, module boundaries, and dependency direction
3. **Project structure** — annotated directory tree with the role of each major folder/file
4. **Environment setup** — prerequisites, environment variables, local dev commands, and any required secrets or service accounts
5. **Core modules & services** — for each major module: what it does, its public API or interface, its dependencies, and notable implementation details
6. **Data models & schemas** — entity relationships, DTOs, database migrations, and validation rules
7. **API contracts** — REST/gRPC/WebSocket endpoints: method, path, auth requirements, request/response shape, and error codes
8. **State management** — patterns used (BLoC, Riverpod, NgRx, signals, etc.), store structure, and data lifecycle
9. **Authentication & authorization** — flows, guards, token handling, roles, and permissions
10. **Inter-service communication** — queues, events, WebSockets, shared libraries, or HTTP clients between services
11. **Testing strategy** — unit, integration, and e2e test locations, how to run them, and any mocking conventions
12. **CI/CD & deployment** — pipeline steps, environment promotion, Dockerfiles, and infra notes
13. **Known patterns & conventions** — naming conventions, folder conventions, code style rules, and any project-specific idioms
14. **Gotchas & non-obvious decisions** — anything that would surprise a new developer

---

## Manual 2 — Directive Overview (for leads and stakeholders)

Target audience: tech leads, product managers, or stakeholders who need to understand the system without reading code — but who are comfortable with technical terminology.

Sections to include:

1. **What this system does** — plain-language summary of the product and its main capabilities
2. **Technology choices** — what each major technology is used for and why (brief rationale if inferable from code or config)
3. **System components** — the main moving parts: services, apps, databases, queues, and external integrations, explained in one paragraph each
4. **Data flow** — how data enters, moves through, and exits the system (user actions → API → processing → storage → response)
5. **Key workflows** — the 3–5 most important end-to-end flows (e.g. user registration, order processing, background job execution)
6. **Security & access control** — who can do what, how authentication works at a high level, and any compliance-relevant notes
7. **Scalability & reliability** — any patterns in place for scaling, retries, error handling, or availability
8. **Dependencies & third-party services** — external APIs, SDKs, or platforms the system relies on
9. **Operational notes** — how to know if the system is healthy, what breaks first under load, and any known limitations
10. **Glossary** — definitions of domain terms and project-specific names that appear in the codebase

---

## Output rules

- Write two separate Markdown files: `[projectName]-manual-technical.md` and `[projectName]-manual-directives.md`
- Do not cross-reference between files — each must be self-contained and readable independently
- Use headers, subheaders, tables, and code blocks where they aid clarity
- Do not fabricate details — if something is not determinable from the code, mark it as `[not found in codebase]`
- Keep `manual-directives.md` free of raw code snippets; use pseudocode or plain descriptions instead
- Aim for exhaustive coverage over brevity — these documents will be uploaded separately to NotebookLM for AI-assisted consultation
- Place both files at the project root unless a `/docs` folder already exists, in which case place them there
- Write `manual-technical.md` in English
- Write `manual-directives.md` in Spanish, using formal but approachable language (usted form is not required but preferible); keep all technical terms, proper nouns, library names, and code references in their original English form

## Mermaid diagrams

Include Mermaid diagrams where they add clarity. Use fenced code blocks with the `mermaid` language tag. Rules:

- **Manual 1** — include diagrams freely wherever they help a developer understand structure or flow
- **Manual 2** — limit to 1–2 high-level diagrams maximum; keep them simple and label-friendly
- Never fabricate relationships — only diagram what is confirmed in the codebase
- Prefer these diagram types based on context:
  - `flowchart TD` — request lifecycle, auth flows, background job pipelines, data processing chains
  - `erDiagram` — database entities and their relationships (use field types if determinable)
  - `sequenceDiagram` — inter-service communication, API call chains, WebSocket handshakes
  - `classDiagram` — module dependencies, DI structure, or domain model hierarchy
  - `graph LR` — high-level system architecture (services, databases, queues, external APIs)
- Keep node labels short and unambiguous — avoid abbreviations unless they are used in the codebase itself
- Add a one-sentence caption below every diagram explaining what it shows
- If a diagram would exceed ~20 nodes, split it into focused sub-diagrams rather than producing one unreadable chart
