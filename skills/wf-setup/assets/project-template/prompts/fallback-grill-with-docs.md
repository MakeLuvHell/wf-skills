# Fallback Prompt: Grill With Docs

Use this when `/grill-with-docs` is unavailable.

```text
Run a grilling session using the project's docs.

Before asking questions, read:
1. `CONTEXT.md`
2. `docs/adr/`
3. Relevant files in `knowledge/`

Rules:
1. Ask one question at a time.
2. For each question, provide your recommended answer first.
3. Do not ask about facts already present in the docs or codebase.
4. If I resolve a domain term, update `CONTEXT.md` immediately.
5. If we make an architectural decision that is hard to reverse, surprising without context, and based on a real trade-off, create an ADR in `docs/adr/`.
6. Keep `CONTEXT.md` as a glossary only. Do not put implementation details there.
7. Do not start implementation until I confirm we have reached shared understanding.

Topic:
{{TOPIC}}

Optional limit:
{{QUESTION_LIMIT_OR_FOCUS}}
```

