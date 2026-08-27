#!/usr/bin/env bash
set -euo pipefail

generation_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)
skill_dir="$generation_root/.agents/skills/rethlas-blueprint-to-paper"
skill_file="$skill_dir/SKILL.md"
checklist="$skill_dir/references/MATH_REWRITE_CHECKLIST.md"
style_guide="$skill_dir/references/STYLE_GUIDE.md"
paper_structure="$skill_dir/references/PAPER_STRUCTURE.md"

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
test -f "$style_guide" || fail "missing $style_guide"
test -f "$paper_structure" || fail "missing $paper_structure"

require_text '^name: rethlas-blueprint-to-paper$' "$skill_file"
require_text 'blueprint_verified\.md' "$skill_file"
require_text 'refuse' "$skill_file"
require_text 'main\.tex' "$skill_file"
require_text 'main\.pdf' "$skill_file"
require_text 'main\.log' "$skill_file"
require_text 'paper_verification\.md' "$skill_file"
require_text 'amsart' "$style_guide"
require_text 'Preserve the mathematics' "$style_guide"
require_text 'fabricat' "$style_guide"
require_text 'short note' "$paper_structure"
require_text 'one headline theorem' "$paper_structure"

if rg -q -- 'fact_graph|paper_write|Danus runtime' "$skill_file" "$checklist"; then
  fail 'Danus runtime dependency leaked into the Rethlas-native skill'
fi

printf 'PASS: rethlas-blueprint-to-paper structure\n'
