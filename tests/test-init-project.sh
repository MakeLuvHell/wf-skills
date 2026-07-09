#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$ROOT/skills/wf-setup/scripts/init-project.sh"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

assert_file() {
  test -f "$1" || fail "expected file: $1"
}

assert_dir() {
  test -d "$1" || fail "expected directory: $1"
}

assert_contains() {
  local file="$1"
  local pattern="$2"
  grep -Fq "$pattern" "$file" || fail "expected '$pattern' in $file"
}

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

minimal="$tmp/minimal-project"
mkdir -p "$minimal"
"$SCRIPT" "$minimal" --mode minimal >/tmp/wf-init-minimal.log

assert_file "$minimal/AGENTS.md"
assert_file "$minimal/CONTEXT.md"
assert_file "$minimal/knowledge/01-project-overview.md"
assert_file "$minimal/knowledge/02-requirements.md"
assert_file "$minimal/knowledge/03-tech-stack.md"
assert_file "$minimal/knowledge/04-task-list.md"
assert_file "$minimal/knowledge/05-review-notes.md"
assert_file "$minimal/knowledge/09-decisions.md"
assert_file "$minimal/knowledge/10-lessons-learned.md"
assert_file "$minimal/docs/adr/README.md"
assert_file "$minimal/docs/spec/README.md"
test ! -e "$minimal/prompts" || fail "minimal mode should not create prompts/"

full="$tmp/full-project"
mkdir -p "$full"
"$SCRIPT" "$full" --mode full >/tmp/wf-init-full.log

assert_file "$full/INITIALIZATION_GUIDE.md"
assert_file "$full/prompts/fallback-grill-me.md"
assert_file "$full/prompts/fallback-grill-with-docs.md"
assert_file "$full/prompts/fallback-to-spec.md"
assert_file "$full/prompts/fallback-to-tickets.md"
assert_file "$full/knowledge/06-api-design.md"
assert_file "$full/knowledge/07-database-schema.md"
assert_file "$full/knowledge/08-testing-strategy.md"

existing="$tmp/existing-project"
mkdir -p "$existing"
printf 'user-owned agents\n' > "$existing/AGENTS.md"
"$SCRIPT" "$existing" --mode minimal >/tmp/wf-init-existing.log

assert_contains "$existing/AGENTS.md" "user-owned agents"
assert_file "$existing/AGENTS.workflow.example.md"
assert_file "$existing/CONTEXT.md"

echo "test-init-project.sh: PASS"

