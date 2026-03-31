---
description: Scaffold or repair the project docs structure
---

Scaffold or repair the standard project documentation structure.

Request details: $ARGUMENTS

Workflow:
- Check whether `docs/` already exists and avoid overwriting existing docs blindly
- Ensure this structure exists:

```text
design_system.md
docs/
  ARCHITECTURE.md
  TASKS.md
  CHANGELOG.md
  plans/
  decisions/
  design/
  runbooks/
    setup.md
```

- Populate missing files with practical content based on the actual repo
- If `design_system.md` is missing, create it from `~/.config/opencode/templates/design_system.md`
- If the codebase already exists, analyze it and fill in `docs/ARCHITECTURE.md` and `docs/runbooks/setup.md` with real details
- Remind the user to add project instructions in `AGENTS.md`

Rules:
- Do not overwrite existing docs without confirmation
- Match the actual package manager, scripts, env vars, and architecture
- The installed template path is `~/.config/opencode/templates/design_system.md`. Do not assume the source repo checkout still exists.
