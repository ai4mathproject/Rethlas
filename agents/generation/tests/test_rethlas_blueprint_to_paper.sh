#!/usr/bin/env bash
set -euo pipefail

generation_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)
skill_dir="$generation_root/.agents/skills/rethlas-blueprint-to-paper"
skill_file="$skill_dir/SKILL.md"
checklist="$skill_dir/references/MATH_REWRITE_CHECKLIST.md"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

require_text() {
  local pattern=$1
  local file=$2
  rg -q -- "$pattern" "$file" || fail "missing '$pattern' in $file"
}

test -f "$skill_file" || fail "missing $skill_file"
test -f "$checklist" || fail "missing $checklist"

require_text '^name: rethlas-blueprint-to-paper$' "$skill_file"
require_text 'blueprint_verified\.md' "$skill_file"
require_text 'refuse' "$skill_file"
require_text 'main\.tex' "$skill_file"
require_text 'main\.pdf' "$skill_file"
require_text 'main\.log' "$skill_file"
require_text 'paper_verification\.md' "$skill_file"

if rg -q -- 'fact_graph|paper_write|Danus runtime' "$skill_file" "$checklist"; then
  fail 'Danus runtime dependency leaked into the Rethlas-native skill'
fi

printf 'PASS: rethlas-blueprint-to-paper structure\n'
