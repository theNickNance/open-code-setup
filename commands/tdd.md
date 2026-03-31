---
description: Run a test-driven development workflow
---

Use a strict TDD workflow for this task: $ARGUMENTS

Workflow:
- Understand the requirement and check `docs/ARCHITECTURE.md` plus any active plan
- Write the tests first
- Run the relevant tests and confirm they fail before implementation
- Implement the minimum code required
- Run the tests again until they pass
- Refactor while keeping the suite green
- Run the broader relevant test suite to catch regressions

Rules:
- Tests come before implementation
- Use realistic domain data
- Mock external boundaries only
- Do not default to snapshot tests
- Every bug fix starts with a failing test
