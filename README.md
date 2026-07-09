# WF Skills

Personal workflow skills for Codex.

## Skills

- `wf-setup`: initialize workflow files in a project.
- `wf-grill`: clarify fuzzy ideas before planning.
- `wf-docgrill`: clarify existing project changes while updating context docs.
- `wf-spec`: synthesize the current conversation into a local spec.
- `wf-tickets`: split a spec or plan into local implementation tickets.
- `wf-exec`: execute one unblocked ticket at a time with verification and knowledge updates.

## Install

Clone this repo, then run:

```bash
./scripts/install.sh
```

The installer symlinks `skills/wf-*` into:

```text
${CODEX_HOME:-$HOME/.codex}/skills
```

Restart Codex after installation.

## Manual Install

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
ln -s "$PWD/skills/wf-setup" "${CODEX_HOME:-$HOME/.codex}/skills/wf-setup"
ln -s "$PWD/skills/wf-grill" "${CODEX_HOME:-$HOME/.codex}/skills/wf-grill"
ln -s "$PWD/skills/wf-docgrill" "${CODEX_HOME:-$HOME/.codex}/skills/wf-docgrill"
ln -s "$PWD/skills/wf-spec" "${CODEX_HOME:-$HOME/.codex}/skills/wf-spec"
ln -s "$PWD/skills/wf-tickets" "${CODEX_HOME:-$HOME/.codex}/skills/wf-tickets"
ln -s "$PWD/skills/wf-exec" "${CODEX_HOME:-$HOME/.codex}/skills/wf-exec"
```

## Typical Flow

New idea:

```text
$wf-grill
$wf-spec
$wf-tickets
$wf-exec
```

Existing project:

```text
$wf-docgrill
$wf-spec
$wf-tickets
$wf-exec
```

Initialize a project:

```text
$wf-setup
```

`wf-setup` defaults to minimal mode and does not overwrite existing files.

## Development

Run tests:

```bash
bash tests/test-init-project.sh
bash tests/test-install.sh
```

Validate skill metadata:

```bash
for skill in skills/wf-*; do
  python /home/dev/.codex/skills/.system/skill-creator/scripts/quick_validate.py "$skill"
done
```

