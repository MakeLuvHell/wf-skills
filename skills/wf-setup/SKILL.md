---
name: wf-setup
description: Use when initializing a repo with the personal workflow structure, including AGENTS.md, CONTEXT.md, knowledge files, ADR/spec directories, and optional fallback prompts.
---

# WF Setup

Initialize the workflow files for the current project. Default to `minimal` mode unless the user asks for the full template.

## Modes

- `minimal`: core workflow files only.
- `full`: minimal plus fallback prompts, initialization guide, API/database/testing knowledge files.

## Procedure

1. Identify the target project directory. Use the current working directory unless the user names another path.
2. Choose mode:
   - Use `minimal` by default.
   - Use `full` only when the user asks for full, fallback prompts, or complete engineering templates.
3. Run the setup script from this skill:

```bash
bash <skill-dir>/scripts/init-project.sh <target-dir> --mode minimal
```

Use `--mode full` for the full template.

## Safety Rules

- Do not overwrite existing project files.
- If `AGENTS.md` exists, create `AGENTS.workflow.example.md`.
- If `CONTEXT.md` exists, create `CONTEXT.workflow.example.md`.
- For existing directories, only add missing files.
- After setup, tell the user which mode was used and remind them to run `wf-grill`, `wf-docgrill`, `wf-spec`, and `wf-tickets` as needed.

