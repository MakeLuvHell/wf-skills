---
name: wf-spec
description: Use after a clarification conversation when the user wants the current context synthesized into a local spec without another interview.
---

# WF Spec

Turn the current conversation into a local spec. Do not re-interview the user. Default to Chinese unless the user asks for another language.

## Procedure

1. Use the current conversation and project files as source material.
2. Read `CONTEXT.md`, `docs/adr/`, and `knowledge/` when present.
3. Put uncertain information under "Open Questions" instead of inventing answers.
4. Write the spec to:

```text
docs/spec/YYYY-MM-DD-short-slug.md
```

5. Prefer local files. Do not publish to an issue tracker unless the user explicitly asks.

## Spec Sections

- Title
- Background
- Problem Statement
- Goals
- Non-Goals
- Target Users
- User Stories
- Core Workflows
- Functional Requirements
- Domain Terms
- Implementation Decisions
- Testing Decisions
- Risks
- Open Questions
- Suggested Ticket Entry Points

