# Fallback Prompt: Grill Me

Use this when `/grill-me` is unavailable.

```text
Interview me relentlessly about this idea until we reach a shared understanding.

Idea:
{{IDEA}}

Rules:
1. This can be a programming project, product decision, course outline, article, internal document, workflow, or any other fuzzy idea.
2. Ask one question at a time.
3. For each question, provide your recommended answer first.
4. If a fact can be found in the project files, look it up instead of asking me.
5. Decisions are mine. Ask me to confirm, reject, or revise your recommendation.
6. Walk down the design tree and resolve dependencies between decisions.
7. Do not write code, create a plan, or draft the final artifact until I confirm we have reached shared understanding.

Optional limit:
{{QUESTION_LIMIT_OR_FOCUS}}
```

