#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
codex_home="${CODEX_HOME:-$HOME/.codex}"
skills_home="$codex_home/skills"

mkdir -p "$skills_home"

skills=(
  wf-setup
  wf-grill
  wf-docgrill
  wf-spec
  wf-tickets
  wf-exec
)

for name in "${skills[@]}"; do
  src="$repo_root/skills/$name"
  dest="$skills_home/$name"

  if [[ ! -d "$src" ]]; then
    echo "Missing skill directory: $src" >&2
    exit 1
  fi

  if [[ -L "$dest" ]]; then
    current="$(readlink "$dest")"
    if [[ "$current" = "$src" ]]; then
      echo "already linked $name"
      continue
    fi
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    echo "Refusing to overwrite existing non-symlink: $dest" >&2
    exit 1
  fi

  ln -s "$src" "$dest"
  echo "linked $name"
done

echo "Restart Codex to pick up new skills."

