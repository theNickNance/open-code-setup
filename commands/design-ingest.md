---
description: Extract design tokens from reference UI
---

Analyze the provided design references and update the project's design system.

Request details: $ARGUMENTS

Workflow:
- Check `docs/design/` for screenshots or references
- If none are available, ask for a screenshot or URL
- Extract colors, typography, spacing, borders, shadows, and distinctive component patterns
- Update `design_system.md` using the existing section structure
- If needed, update styling files such as `globals.css`, font imports, or Tailwind-related config

Rules:
- Note which reference each token came from
- If references conflict, flag the conflict before choosing
- Call out uncertainty explicitly
