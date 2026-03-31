# OpenCode Setup

A portable OpenCode configuration repo built around committed project docs, reusable slash commands, and a small global rules file.

## What It Includes

```text
AGENTS.md
install.sh
commands/
  adr.md
  design-ingest.md
  init-docs.md
  plan.md
  tasks.md
  tdd.md
templates/
  design_system.md
```

- `AGENTS.md`: global OpenCode rules installed to `~/.config/opencode/AGENTS.md`
- `commands/*.md`: OpenCode slash commands installed to `~/.config/opencode/commands/`
- `templates/design_system.md`: reusable design-system template installed to `~/.config/opencode/templates/design_system.md`

## Install

```bash
git clone <repo-url> ~/open-code-setup
cd ~/open-code-setup
chmod +x install.sh
./install.sh
```

Manual install:

```bash
mkdir -p ~/.config/opencode/commands ~/.config/opencode/templates
cp ~/open-code-setup/AGENTS.md ~/.config/opencode/AGENTS.md
cp ~/open-code-setup/commands/*.md ~/.config/opencode/commands/
cp ~/open-code-setup/templates/design_system.md ~/.config/opencode/templates/design_system.md
```

## Workflow Model

The setup keeps the always-on prompt small and pushes heavier process guidance into slash commands.

- Global behavior lives in `AGENTS.md`
- Project-specific behavior should live in project `AGENTS.md`
- Project docs provide durable context:

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
```

Recommended session flow:

1. Read the project `AGENTS.md`
2. Fall back to project `CLAUDE.md` only if no `AGENTS.md` exists
3. Read `docs/ARCHITECTURE.md`
4. Check `docs/plans/` for work in progress
5. Check `docs/TASKS.md` for P0 or blocked tasks
6. Read `design_system.md` for frontend work

## Commands

- `/plan`: create a plan before larger implementation work
- `/tasks`: view or update `docs/TASKS.md`
- `/adr`: write architecture decision records
- `/tdd`: enforce a test-first workflow
- `/init-docs`: scaffold or repair the project docs structure
- `/design-ingest`: extract design tokens from screenshots or references

## Migration From Claude Code

OpenCode supports some Claude Code conventions as fallback behavior, but this repo targets the native OpenCode layout.

- `~/.claude/CLAUDE.md` -> `~/.config/opencode/AGENTS.md`
- `~/.claude/skills/*` -> `~/.config/opencode/commands/*.md`
- Project `CLAUDE.md` -> project `AGENTS.md`

Relevant docs:

- Config: https://opencode.ai/docs/config/
- Rules: https://opencode.ai/docs/rules/
- Commands: https://opencode.ai/docs/commands/
- Agents: https://opencode.ai/docs/agents/

## Customize

- Edit `AGENTS.md` to change your default working rules
- Edit `commands/*.md` to change workflows or add new commands
- Reuse and adapt `templates/design_system.md` for new projects

## License

MIT
