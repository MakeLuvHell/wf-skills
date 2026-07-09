#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$ROOT/scripts/install.sh"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

assert_link_to_repo() {
  local name="$1"
  local path="$CODEX_HOME/skills/$name"
  test -L "$path" || fail "expected symlink: $path"
  local target
  target="$(readlink "$path")"
  test "$target" = "$ROOT/skills/$name" || fail "expected $path -> $ROOT/skills/$name, got $target"
}

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

export CODEX_HOME="$tmp/codex-home"
"$SCRIPT" >/tmp/wf-install.log

for name in wf-setup wf-grill wf-docgrill wf-spec wf-tickets wf-exec; do
  assert_link_to_repo "$name"
done

blocked_home="$tmp/blocked-home"
export CODEX_HOME="$blocked_home"
mkdir -p "$CODEX_HOME/skills/wf-grill"
if "$SCRIPT" >/tmp/wf-install-blocked.log 2>&1; then
  fail "install should fail when an existing non-symlink skill directory would be overwritten"
fi
grep -Fq "Refusing to overwrite" /tmp/wf-install-blocked.log || fail "expected refusal message"

echo "test-install.sh: PASS"

