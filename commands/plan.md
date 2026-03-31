---
description: Create a change plan before implementation
---

Create a new plan for this change: $ARGUMENTS

Workflow:
- Determine the next plan number from `docs/plans/`
- Create `docs/plans/PLAN-[NNN]-[slug].md`
- Use this structure:

```markdown
# PLAN-[NNN]-[slug]

**Status**: Draft
**Created**: [today's date]
**Completed**: —
**Tasks**: [[TASKS]] — T-[xxx]

## Problem

One paragraph max.

## Approach

- Files to create or modify
- Data model changes, if any
- API changes, if any
- New dependencies, if any

## Scope

**In scope:**
-

**Out of scope:**
-

## Risks & Open Questions

| # | Question | Status |
|---|----------|--------|
| 1 | | Open |

## Task Breakdown

- [ ] Write tests first
- [ ] Implement
- [ ] Integration verification
- [ ] Update `docs/ARCHITECTURE.md`
- [ ] Update `docs/CHANGELOG.md`
- [ ] Full test suite passes

## Test Strategy

What verifies this works?

## Outcome

_Fill in after completion._
```

Rules:
- Put tests before implementation steps
- Keep breakdown items small enough to land cleanly
- Present the plan for review before major implementation work
