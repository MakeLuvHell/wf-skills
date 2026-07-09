---
name: wf-setup
description: Use when initializing a repo with the personal workflow structure, including AGENTS.md, CONTEXT.md, knowledge files, ADR/spec directories, and optional fallback prompts.
---

# WF Setup

Initialize the workflow files for the current project. Ask the user to choose `minimal` or `full` unless they already specified a mode. Recommend `minimal` for most projects.

## Modes

- `minimal`: core workflow files only.
- `full`: minimal plus fallback prompts, initialization guide, API/database/testing knowledge files.

## Procedure

1. Identify the target project directory. Use the current working directory unless the user names another path.
2. Choose mode:
   - If the user already specified `minimal` or `full`, use that.
   - Otherwise ask the user to choose. Recommend `minimal`.
   - Use `full` when the user wants fallback prompts, initialization guide, or complete engineering templates.
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
