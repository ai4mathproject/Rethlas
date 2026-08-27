# Rethlas Blueprint-to-Paper Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a Rethlas-native Codex skill that converts a verified proof blueprint into a readable, independently compiled and re-verified `amsart` paper.

**Architecture:** The Codex-facing skill reads the problem, `blueprint_verified.md`, and optional references directly, then writes a paper workspace under the existing result directory. Static reference files control mathematical prose and paper structure. A small shell gate compiles twice with XeLaTeX and rejects fatal log patterns; the existing Rethlas proof verifier remains the mathematical authority.

**Tech Stack:** Codex skills (`SKILL.md`), POSIX shell, XeLaTeX, existing Rethlas `verify_proof_service`, Markdown reference guides.

---

### Task 1: Add the Rethlas-native skill contract

**Files:**
- Create: `agents/generation/.agents/skills/rethlas-blueprint-to-paper/SKILL.md`
- Create: `agents/generation/.agents/skills/rethlas-blueprint-to-paper/references/MATH_REWRITE_CHECKLIST.md`

- [ ] **Step 1: Write the structural smoke test**

Create `agents/generation/tests/test_rethlas_blueprint_to_paper.sh` with checks that the skill exists, has `name: rethlas-blueprint-to-paper`, names all four required output files, refuses an absent verified blueprint, and contains no `fact_graph`, `paper_write`, or Danus runtime dependency.

- [ ] **Step 2: Run the test and verify it fails**

Run:

```bash
bash agents/generation/tests/test_rethlas_blueprint_to_paper.sh
```

Expected: nonzero exit because `SKILL.md` does not yet exist.

- [ ] **Step 3: Write the skill contract and semantic checklist**

The skill frontmatter is:

```yaml
---
name: rethlas-blueprint-to-paper
description: Convert a verified Rethlas blueprint into a readable standalone LaTeX mathematics paper, compile it, and re-verify the paper's mathematical argument.
---
```

The workflow must resolve `data/<problem_id>.md`, require
`results/<problem_id>/blueprint_verified.md`, read optional
`data/<problem_id>.refs/`, create `results/<problem_id>/paper/`, and produce
`main.tex`, `main.pdf`, `main.log`, and `paper_verification.md`. It must explicitly
forbid invented mathematics, citations, authors, or bibliographic metadata.

- [ ] **Step 4: Run the structural test and verify it passes**

Run the command from Step 2. Expected: `PASS: rethlas-blueprint-to-paper structure`.

- [ ] **Step 5: Commit the contract**

```bash
git add agents/generation/.agents/skills/rethlas-blueprint-to-paper/SKILL.md \
  agents/generation/.agents/skills/rethlas-blueprint-to-paper/references/MATH_REWRITE_CHECKLIST.md \
  agents/generation/tests/test_rethlas_blueprint_to_paper.sh
git commit -m "Add Rethlas blueprint-to-paper contract"
```

### Task 2: Adapt Danus writing and structure guidance

**Files:**
- Create: `agents/generation/.agents/skills/rethlas-blueprint-to-paper/references/STYLE_GUIDE.md`
- Create: `agents/generation/.agents/skills/rethlas-blueprint-to-paper/references/PAPER_STRUCTURE.md`
- Modify: `agents/generation/tests/test_rethlas_blueprint_to_paper.sh`

- [ ] **Step 1: Extend the smoke test**

Add checks that both reference files exist, use `amsart`, require theorem/proof
fidelity, prohibit fabricated citations, and select the short-note tier for one
headline theorem.

- [ ] **Step 2: Run the test and verify the new checks fail**

Expected: nonzero exit naming the absent style or structure reference.

- [ ] **Step 3: Write the adapted guides**

Retain the Danus integrity floor, theorem/proof style, cross-reference rules,
short-note/mid-paper structures, and citation discipline. Remove fact-graph,
PROJECT_BRIEF, worker-swarm, provenance-id, Danus-disclosure, and bibliography-ledger
requirements. Add Rethlas-specific rules: the verified blueprint is authoritative,
known inputs stay visibly external, and absent verified references result in no
bibliography rather than placeholder citations.

- [ ] **Step 4: Run the smoke test and verify it passes**

Expected: `PASS: rethlas-blueprint-to-paper structure`.

- [ ] **Step 5: Commit the reference guides**

```bash
git add agents/generation/.agents/skills/rethlas-blueprint-to-paper/references \
  agents/generation/tests/test_rethlas_blueprint_to_paper.sh
git commit -m "Adapt mathematical paper guidance for Rethlas"
```

### Task 3: Add deterministic LaTeX compilation

**Files:**
- Create: `agents/generation/.agents/skills/rethlas-blueprint-to-paper/scripts/compile_paper.sh`
- Modify: `agents/generation/tests/test_rethlas_blueprint_to_paper.sh`

- [ ] **Step 1: Add compile-gate tests**

The test creates a temporary minimal `amsart` document, runs the compile script,
and asserts that `main.pdf` and `main.log` exist. It also invokes the script on a
missing `.tex` path and asserts a nonzero exit.

- [ ] **Step 2: Run the test and verify it fails**

Expected: nonzero exit because `compile_paper.sh` is absent.

- [ ] **Step 3: Implement the compile gate**

The script must validate one explicit `.tex` argument, resolve an explicit safe
paper directory, run

```bash
xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex
xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex
```

inside that directory, preserve the final `main.log`, and fail if the complete log
contains `Undefined control sequence`, unresolved references/citations, missing
glyphs/files, `Emergency stop`, `Fatal error`, or `Overfull \\hbox`.

- [ ] **Step 4: Run the full test and verify it passes**

Expected: the valid fixture compiles, the invalid invocation fails, and the test
prints its PASS line.

- [ ] **Step 5: Commit the compile gate**

```bash
git add agents/generation/.agents/skills/rethlas-blueprint-to-paper/scripts/compile_paper.sh \
  agents/generation/tests/test_rethlas_blueprint_to_paper.sh
git commit -m "Add blueprint paper compile gate"
```

### Task 4: Validate discovery and run an end-to-end fixture

**Files:**
- Modify: `agents/generation/AGENTS.md` only if a minimal optional post-verification
  discovery note can be staged without including pre-existing user edits.
- Create during the smoke run: `agents/generation/results/theta/minimal_good_lattice_splitting_independence/paper/*` (generated and not committed).

- [ ] **Step 1: Validate the Codex target**

Run:

```bash
/opt/homebrew/bin/python3.13 /Users/hoxide/.codex/skills/migrate-to-codex/scripts/migrate-to-codex.py \
  --validate-target agents/generation
```

Expected: valid skill frontmatter and no actionable generated-artifact errors.

- [ ] **Step 2: Run the skill against the verified theta blueprint**

Invoke Codex from `agents/generation` with the existing `CODEX_HOME`, asking it to
use `$rethlas-blueprint-to-paper` for
`theta/minimal_good_lattice_splitting_independence`. The run must use the existing
verified blueprint and must not invoke the proof-generation loop again.

- [ ] **Step 3: Check the paper artifacts and full logs**

Assert all four required files exist, run `scripts/compile_paper.sh` on `main.tex`,
scan for leaked Rethlas workflow terms and unsupported citations, and check that
`paper_verification.md` records the verified blueprint path, compile exit zero,
and the paper-level verifier verdict.

- [ ] **Step 4: Run the full structural test once more**

Run `bash agents/generation/tests/test_rethlas_blueprint_to_paper.sh`. Expected:
PASS with no failed assertion.

- [ ] **Step 5: Commit and push only migration sources**

Stage only the skill, its tests, the implementation plan, and any isolated
AGENTS.md hunk belonging to this task. Do not stage generated paper artifacts or
any pre-existing dirty Rethlas files.

```bash
git push origin main
```
