---
description: Create an architecture decision record
---

Create a new ADR for this decision: $ARGUMENTS

Workflow:
- Determine the next ADR number from `docs/decisions/`
- Create `docs/decisions/ADR-[NNN]-[slug].md`
- Use this structure:

```markdown
# ADR-[NNN]-[slug]

**Date**: [today's date]
**Status**: Proposed
**Related**: [[PLAN-NNN-slug]] | [[ADR-NNN-slug]] (if applicable)

## Context

What situation or problem prompted this decision?

## Decision

What did we decide? One clear sentence, then elaboration.

## Alternatives Considered

| Alternative | Pros | Cons | Why not chosen |
|------------|------|------|----------------|
| | | | |

## Consequences

**Positive:**
-

**Negative / tradeoffs we're accepting:**
-

**What this makes easier or harder in the future:**
-
```

Rules:
- Include at least 2 real alternatives with honest pros and cons
- Keep Context and Decision concise
- ADRs are never deleted; supersede them with newer ADRs instead
