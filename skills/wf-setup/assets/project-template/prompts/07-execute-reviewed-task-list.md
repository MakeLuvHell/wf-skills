# Prompt: Execute Reviewed Task List

Use this only after the task list has been reviewed and updated.

```text
Execute the reviewed task list below.

Task list:
{{REVIEWED_TASK_LIST}}

Rules:
1. Work on one task at a time.
2. Before each task, read the relevant files in `knowledge/`.
3. Do not skip dependencies.
4. Keep changes scoped to the current task.
5. After each task, run the narrowest useful verification.
6. Report what changed, how it was verified, and what task is next.
7. If a task reveals a new decision, risk, or lesson, update the relevant `knowledge/` file.
8. If requirements are unclear, stop and ask before guessing.
```

