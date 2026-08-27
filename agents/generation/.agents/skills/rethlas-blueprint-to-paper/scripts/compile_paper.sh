#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  printf 'usage: %s /absolute/or/relative/path/to/main.tex\n' "$0" >&2
  exit 64
fi

source_path=$1
if [[ ! -f "$source_path" ]]; then
  printf 'error: LaTeX source does not exist: %s\n' "$source_path" >&2
  exit 66
fi

if ! command -v xelatex >/dev/null 2>&1; then
  printf 'error: xelatex is not available on PATH\n' >&2
  exit 69
fi

source_dir=$(cd "$(dirname "$source_path")" && pwd -P)
source_name=$(basename "$source_path")
if [[ "$source_name" != *.tex ]]; then
  printf 'error: source must have a .tex suffix: %s\n' "$source_name" >&2
  exit 65
fi

job_name=${source_name%.tex}
final_log="$source_dir/$job_name.log"

for pass in 1 2; do
  pass_log="$source_dir/compile-pass-$pass.log"
  if ! (
    cd "$source_dir"
    xelatex \
      -interaction=nonstopmode \
      -halt-on-error \
      -file-line-error \
      "$source_name"
  ) >"$pass_log" 2>&1; then
    printf 'error: XeLaTeX pass %s failed; complete command log: %s\n' \
      "$pass" "$pass_log" >&2
    if [[ -f "$final_log" ]]; then
      printf 'error: LaTeX log: %s\n' "$final_log" >&2
    fi
    exit 1
  fi
done

if [[ ! -s "$final_log" ]]; then
  printf 'error: XeLaTeX did not produce a final log: %s\n' "$final_log" >&2
  exit 1
fi

fatal_pattern='Undefined control sequence|LaTeX Warning: Reference.*undefined|LaTeX Warning: Citation.*undefined|There were undefined references|There were undefined citations|Missing character: There is no|LaTeX Error: File .* not found|Emergency stop|Fatal error|Overfull \\hbox'
fatal_report="$source_dir/compile-fatal-findings.log"

if rg -n -- "$fatal_pattern" "$final_log" >"$fatal_report"; then
  printf 'error: fatal LaTeX findings detected in %s\n' "$final_log" >&2
  sed -n '1,240p' "$fatal_report" >&2
  exit 1
fi

underfull_report="$source_dir/compile-underfull-findings.log"
rg -n -- 'Underfull \\hbox|Underfull \\vbox' "$final_log" \
  >"$underfull_report" || true

pdf_path="$source_dir/$job_name.pdf"
if [[ ! -s "$pdf_path" ]]; then
  printf 'error: XeLaTeX did not produce a PDF: %s\n' "$pdf_path" >&2
  exit 1
fi

printf 'compile: ok\n'
printf 'pdf: %s\n' "$pdf_path"
printf 'log: %s\n' "$final_log"
if [[ -s "$underfull_report" ]]; then
  printf 'underfull findings: %s\n' "$underfull_report"
else
  printf 'underfull findings: none\n'
fi
