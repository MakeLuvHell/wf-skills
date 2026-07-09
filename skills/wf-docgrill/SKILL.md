---
name: wf-docgrill
description: Use when clarifying an existing project change that should respect or update CONTEXT.md, docs/adr, knowledge files, domain language, or architecture decisions.
---

# WF Docgrill

Clarify an existing project change while keeping domain docs current. Use this instead of `wf-grill` when the discussion may change project language or architectural decisions.

## Procedure

1. Read relevant project context first:
   - `CONTEXT.md`
   - `CONTEXT-MAP.md` if present
   - `docs/adr/`
   - `knowledge/`
   - relevant code when facts can be verified locally
2. Ask one question at a time, with a recommended answer first.
3. Challenge vague or conflicting terms immediately.
4. When a domain term is resolved, update `CONTEXT.md` immediately.
5. Keep `CONTEXT.md` as a glossary only. Do not put implementation details, specs, or scratch notes there.
6. Offer an ADR only when the decision is hard to reverse, surprising without context, and based on a real trade-off.
7. Do not implement until the user confirms shared understanding.

## ADR Rules

- Store ADRs in `docs/adr/`.
- Use the next sequential filename: `0001-short-title.md`, `0002-short-title.md`.
- Keep ADRs short: context, decision, and reason are enough.

