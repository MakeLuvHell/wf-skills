# Fallback Prompt: To Spec

Use this when `/to-spec` is unavailable.

Important: run this in the same conversation as the grilling session. Do not clear context first.

```text
Convert the current conversation into a structured spec.

Use only information established in this conversation and the project files. If something is uncertain, put it under Open Questions instead of inventing an answer.

Write the spec to `docs/spec/YYYY-MM-DD-{{SLUG}}.md`.

Include:
1. Title
2. Background
3. Problem statement
4. Goals
5. Non-goals
6. Target users
7. User stories
8. Core workflows
9. Functional requirements
10. Data and domain terms
11. Edge cases
12. Testing strategy
13. Risks
14. Open questions
15. Suggested task-list entry points

After writing the spec, update relevant files in `knowledge/` if the information is now confirmed.
```
