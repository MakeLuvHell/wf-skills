---
name: wf-grill
description: Use when the user has a fuzzy idea, product decision, article, course, workflow, or software feature and wants clarification before planning or implementation.
---

# WF Grill

Clarify the idea before planning or writing the final artifact. Default to Chinese unless the user asks for another language.

## Procedure

1. Do not implement, draft the final artifact, or create a plan yet.
2. Ask one question at a time.
3. For each question, give a recommended answer first, then ask the user to confirm, reject, or revise it.
4. Support non-code scenarios: product strategy, writing, course design, internal documents, workflows, learning plans, and software projects.
5. If project facts are available in `CONTEXT.md`, `knowledge/`, `docs/adr/`, `docs/spec/`, or `tickets.md`, read them instead of asking the user.
6. Keep asking until there is shared understanding.
7. Stop when the user confirms the idea is clear enough for `wf-spec`, `wf-tickets`, or direct execution.

## Do Not

- Batch many questions together.
- Ask for facts already available in project files.
- Treat all ideas as software projects.
- Move to planning before the user confirms shared understanding.

