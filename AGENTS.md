# AGENTS.md — Global

## Session Start

1. Read the project-level `AGENTS.md` if one exists.
2. If no `AGENTS.md` exists, fall back to a project-level `CLAUDE.md`.
3. Read `docs/ARCHITECTURE.md` if it exists.
4. Check `docs/plans/` for plans with status `In Progress`.
5. Check `docs/TASKS.md` for any P0 or blocked work and surface it immediately.
6. Read `design_system.md` if frontend work is involved.

Do not start implementation without completing these steps.

## Stack Defaults

Use these unless project instructions say otherwise:

- Next.js App Router, TypeScript strict, Tailwind CSS, shadcn/ui
- React Server Components by default; client components only for interactivity
- PostgreSQL with Prisma or Drizzle, matching the repo
- pnpm or npm, matching the repo
- Vercel, Vitest, React Testing Library, Playwright

## Code Style

- Files use `kebab-case.tsx`. Components use `PascalCase`.
- Named exports by default. Use default exports only where the framework requires them.
- Use `interface` for object shapes and `type` for unions/intersections.
- Explicit return types on exported functions.
- No `any` without a comment explaining why.
- Import order: framework, external packages, aliases, then relatives.
- Comments explain why, not what.
- Errors are handled explicitly and never swallowed silently.

## Collaboration

- If the user's direction is materially ambiguous, stop and ask a short clarifying question instead of guessing and proceeding.
- If a requested change would benefit from verification beyond unit tests, say what you verified and what remains unverified.

## Component Rules

- One component per file unless a tightly coupled pair belongs together.
- Composition over configuration.
- Keep `"use client"` boundaries small.
- Every list or table needs a skeleton loading state and an empty state.

## Frontend Rules

Read `design_system.md` before writing frontend code.

- Never use raw Tailwind colors when a design system exists.
- Never pick fonts, colors, or spacing ad hoc if the project already defines them.
- Avoid generic AI-looking UI.
- Use realistic domain content in examples and mock UI.
- If no design system exists, ask before making major visual decisions.

## Git

- Use conventional commits: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`, `test:`
- Include task IDs and plan references when the project uses them
- Keep commits atomic

Before every commit:
1. Run the relevant tests
2. Run the relevant lint, typecheck, and build steps when the change could affect them
3. Update `docs/ARCHITECTURE.md` when architecture, data model, or major patterns changed
4. Update `docs/CHANGELOG.md` when a planned change is completed
5. Update `docs/TASKS.md` and any related plan docs
6. Present a concise summary and verification notes before committing when the user expects review

## Verification

- Prefer the smallest meaningful verification that proves the change works, but do not stop at static reasoning when the repo provides runnable checks.
- For UI changes, verify the user-visible behavior with the relevant test, build, or manual flow and call out anything not exercised.
- For schema, migration, or integration changes, verify both the code path and the operational path, not just isolated unit tests.
- If verification cannot be completed, say exactly what blocked it instead of implying confidence.

## Documentation

Projects should keep durable context in committed markdown files:

```text
docs/
  ARCHITECTURE.md
  TASKS.md
  CHANGELOG.md
  plans/
  decisions/
  design/
  runbooks/
```

Rules:
- Docs update in the same change as the code they describe
- `docs/ARCHITECTURE.md` is the source of truth for current system shape
- Plans and ADRs are permanent records and should not be deleted
- Use wiki-links like `[[PLAN-003-auth-setup]]` when the repo already uses that convention

## When Plans Are Required

Create a plan before implementation when a change:
- touches more than 3 files
- changes the data model
- adds a dependency
- changes an API contract
- is likely to take more than about 30 minutes
- could break existing functionality

## Test-Driven Development

- Write tests before implementation
- Test business logic, API behavior, state transitions, user-visible error paths, and regressions
- Mock external boundaries only
- Never use snapshot tests as the default strategy
- Every bug fix should start with a failing test

## Maintainability

- Reuse existing hooks, utilities, and components before creating parallel abstractions
- Ask before adding new dependencies when an existing package may already solve the problem
- Add comments at integration boundaries and for non-obvious choices
- Keep `docs/ARCHITECTURE.md` aligned with actual patterns in the codebase
- Prefer config and workflow changes that are easy to audit, re-run, and verify over one-off local tweaks
