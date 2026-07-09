# Prompt: Goal Mode

Use this when you are ready to let an agent run the reviewed plan end to end.

```text
/g goal Follow the reviewed task list in `knowledge/04-task-list.md` and implement "{{PROJECT_NAME}}".

Rules:
1. Read `AGENTS.md` and the relevant `knowledge/` files first.
2. Execute tasks in dependency order.
3. Complete and verify one task before starting the next.
4. Keep implementation scoped to the task list.
5. If a review note is unresolved, stop and address it before implementation.
6. Update `knowledge/09-decisions.md` and `knowledge/10-lessons-learned.md` when new decisions or lessons appear.
7. At the end, summarize changed files, verification results, remaining risks, and recommended next steps.
```

