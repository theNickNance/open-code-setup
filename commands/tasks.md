---
description: View or manage tasks in docs/TASKS.md
---

Operate on `docs/TASKS.md` using this request: $ARGUMENTS

Supported intents:
- `/tasks` with no arguments: show open tasks grouped by priority and surface any P0 or blocked work first
- `/tasks add ...`: add a new task using the next available `T-###`
- `/tasks done T-###`: move the task to the Archive section and mark completion date
- `/tasks update T-### ...`: update priority, title, description, or plan link
- `/tasks clean`: move completed tasks out of Active if needed

Rules:
- Keep the existing compact block format
- Never renumber task IDs
- Every task needs a short title, priority, creator, date, and description
- Archive completed tasks instead of deleting them
