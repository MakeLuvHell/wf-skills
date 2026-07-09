---
name: wf-exec
description: Use when executing local workflow tickets or a reviewed task list while respecting blockers, verification, and knowledge-base updates.
---

# WF Exec

Execute workflow work one closed loop at a time. This is an execution guardrail, not a license to batch unrelated tasks.

## Procedure

1. Read project guidance:
   - `AGENTS.md`
   - `CONTEXT.md`
   - `docs/adr/`
   - `knowledge/`
   - `docs/spec/`
   - `tickets.md` or `knowledge/04-task-list.md`
2. Find the next unblocked ticket or task. A blocked ticket cannot start.
3. Before editing, state:
   - selected ticket or task
   - why it is unblocked
   - intended verification command or manual check
4. Execute only that ticket or task.
5. Run verification before claiming completion.
6. Update status in `tickets.md` or `knowledge/04-task-list.md` when practical.
7. Update `knowledge/09-decisions.md`, `knowledge/10-lessons-learned.md`, `CONTEXT.md`, or `docs/adr/` when new durable knowledge appears.
8. Report what changed, how it was verified, remaining risk, and the next unblocked item.

## Rules

- Do not skip blockers.
- Do not execute multiple tickets in one batch unless the user explicitly asks.
- Do not claim completion without fresh verification.
- Do not change domain language without updating `CONTEXT.md`.

