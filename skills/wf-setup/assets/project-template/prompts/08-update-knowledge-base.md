# Prompt: Update Knowledge Base

Use this after meaningful implementation, review, or debugging work.

```text
Update the project knowledge base based on this work.

Work summary:
{{WORK_SUMMARY}}

Files changed:
{{FILES_CHANGED}}

Verification performed:
{{VERIFICATION}}

Decisions made:
{{DECISIONS}}

Issues encountered:
{{ISSUES}}

Update only the relevant files under `knowledge/`.

Focus on:
1. Decisions future agents should preserve.
2. Lessons learned.
3. Updated requirements.
4. Updated API or database details.
5. Testing notes and verification commands.
6. Known risks or follow-ups.
```

