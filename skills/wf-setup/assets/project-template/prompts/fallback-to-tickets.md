# Fallback Prompt: To Tickets

Use this when `/to-tickets` is unavailable.

```text
Break the current spec, plan, or conversation into tracer-bullet implementation tickets.

Source:
{{SOURCE_SPEC_OR_PLAN}}

Rules:
1. Each ticket must deliver a narrow but complete vertical slice.
2. Each ticket must be independently demoable or verifiable.
3. Each ticket should fit in a single fresh context window.
4. Prefer dependency order: blockers first.
5. For each ticket, list "Blocked by" explicitly.
6. Avoid layer-only tickets unless the work is a wide refactor.
7. Ask me to approve the ticket breakdown before treating it as final.

Output:
- Title
- Blocked by
- What it delivers
- Acceptance criteria

If using local files, write the approved result to `tickets.md` at the repo root.
```

