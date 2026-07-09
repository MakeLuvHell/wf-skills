#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: init-project.sh [target-dir] [--mode minimal|full]

Initializes workflow files in target-dir. Defaults to current directory and
minimal mode for non-interactive script use. Existing files are not overwritten.
USAGE
}

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skill_dir="$(cd "$script_dir/.." && pwd)"
template_dir="$skill_dir/assets/project-template"

target_dir="."
mode="minimal"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode)
      mode="${2:-}"
      shift 2
      ;;
    --mode=*)
      mode="${1#--mode=}"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      target_dir="$1"
      shift
      ;;
  esac
done

case "$mode" in
  minimal|full) ;;
  *)
    echo "Invalid mode: $mode" >&2
    usage >&2
    exit 2
    ;;
esac

target_dir="$(mkdir -p "$target_dir" && cd "$target_dir" && pwd)"

copy_file() {
  local rel="$1"
  local src="$template_dir/$rel"
  local dest="$target_dir/$rel"

  if [[ ! -f "$src" ]]; then
    echo "Template missing: $rel" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$dest")"

  if [[ -e "$dest" ]]; then
    case "$rel" in
      AGENTS.md) dest="$target_dir/AGENTS.workflow.example.md" ;;
      CONTEXT.md) dest="$target_dir/CONTEXT.workflow.example.md" ;;
      *) echo "skip existing $rel"; return 0 ;;
    esac
  fi

  if [[ -e "$dest" ]]; then
    echo "skip existing ${dest#$target_dir/}"
    return 0
  fi

  cp "$src" "$dest"
  echo "create ${dest#$target_dir/}"
}

minimal_files=(
  AGENTS.md
  CONTEXT.md
  knowledge/01-project-overview.md
  knowledge/02-requirements.md
  knowledge/03-tech-stack.md
  knowledge/04-task-list.md
  knowledge/05-review-notes.md
  knowledge/09-decisions.md
  knowledge/10-lessons-learned.md
  docs/adr/README.md
  docs/spec/README.md
)

full_files=(
  INITIALIZATION_GUIDE.md
  knowledge/06-api-design.md
  knowledge/07-database-schema.md
  knowledge/08-testing-strategy.md
  prompts/README.md
  prompts/fallback-grill-me.md
  prompts/fallback-grill-with-docs.md
  prompts/fallback-to-spec.md
  prompts/fallback-to-tickets.md
)

for rel in "${minimal_files[@]}"; do
  copy_file "$rel"
done

if [[ "$mode" = "full" ]]; then
  for rel in "${full_files[@]}"; do
    copy_file "$rel"
  done
fi

echo "Workflow initialized in $target_dir ($mode)"
