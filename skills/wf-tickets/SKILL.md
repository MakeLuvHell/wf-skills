---
name: wf-tickets
description: Use when splitting a spec, plan, or current conversation into local implementation tickets with dependencies and acceptance criteria.
---

# WF Tickets

Break a spec or plan into tracer-bullet implementation tickets. Default to Chinese unless the user asks for another language.

## Procedure

1. Read the source spec, plan, or current conversation.
2. Read `CONTEXT.md`, `docs/adr/`, and `knowledge/` when present.
3. Draft vertical-slice tickets:
   - Each ticket delivers a narrow but complete user-visible or verifiable behavior.
   - Each ticket fits in a fresh context window.
   - Each ticket lists blockers explicitly.
4. Present the breakdown and ask the user to approve the granularity and blocking edges.
5. After approval, write local tickets to `tickets.md`.
6. Do not publish to GitHub, GitLab, Linear, or another tracker unless the user explicitly asks.

## Ticket Format

Each ticket must include:

- Title
- What to build
- Blocked by
- Acceptance criteria

## Wide Refactors

If the work is a wide mechanical refactor that cannot be sliced vertically, use expand-contract tickets: expand, migrate in batches, contract.

