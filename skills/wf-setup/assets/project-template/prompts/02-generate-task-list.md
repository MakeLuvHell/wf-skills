# Prompt: Generate Task List

Use this after the requirements are clear enough to plan.

```text
Based on the confirmed requirements below, create an executable task list.

Confirmed requirements:
{{CONFIRMED_REQUIREMENTS}}

Project context:
{{PROJECT_CONTEXT}}

Requirements:
1. Split tasks by area: product, frontend, backend, database, testing, documentation, and deployment if relevant.
2. Each task must have a clear output.
3. Each task should be small enough to verify independently.
4. Mark dependencies between tasks.
5. Give a recommended execution order.
6. Include verification steps for each task.
7. Identify assumptions and risks.

Output format:
- Summary
- Task table
- Recommended order
- Risks and assumptions
- Verification checklist
```

