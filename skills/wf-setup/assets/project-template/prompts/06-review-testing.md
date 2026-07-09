# Prompt: Testing Review

```text
You are a senior test engineer. Review the project task list and test strategy.

Project:
{{PROJECT_CONTEXT}}

Task list:
{{TASK_LIST}}

Testing strategy:
{{TESTING_STRATEGY}}

Focus on:
1. Critical happy paths.
2. Boundary cases.
3. Error and recovery flows.
4. Data validation.
5. Permission or authentication cases.
6. Integration points.
7. Manual verification gaps.
8. What should not be tested because it would be brittle or low value.

Output only:
- Missing tests
- Risky assumptions
- Required changes
- Recommended verification commands
```

