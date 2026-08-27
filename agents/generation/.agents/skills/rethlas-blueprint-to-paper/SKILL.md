---
name: rethlas-blueprint-to-paper
description: Convert a verified Rethlas blueprint into a readable standalone LaTeX mathematics paper, compile it, and re-verify the paper's mathematical argument.
---

# Rethlas Blueprint to Paper

Use this skill only after Rethlas has published a verified proof blueprint and
the user asks for a paper, readable LaTeX, or a publication-style version of the
proof. This is a post-verification transformation. It does not run the proving
loop again.

## Required input

The caller supplies `problem_id`. Resolve all paths relative to the generation
workspace:

```text
data/<problem_id>.md
results/<problem_id>/blueprint_verified.md
data/<problem_id>.refs/                 # optional
```

If the problem file is absent, stop and report the missing path. If
`blueprint_verified.md` is absent, refuse to write a paper: an unverified
blueprint is not an admissible source. Do not silently fall back to
`blueprint.md`, memory records, logs, or model recollection.

Read the problem statement and verified blueprint completely. If the optional
reference directory exists, read only the files relevant to definitions,
attribution, or known inputs used in the paper. Treat reference files as
user-provided context, not as verified facts. For PDF references, use an existing
text extraction under the reference directory; do not inspect PDF binaries.

## Required output

Create an isolated paper workspace:

```text
results/<problem_id>/paper/
```

It must contain:

```text
main.tex
main.pdf
main.log
paper_verification.md
```

Do not overwrite `blueprint_verified.md`. Do not write paper sources elsewhere.

## Read the local guidance

Before drafting, read these skill-local files completely:

1. `references/STYLE_GUIDE.md`;
2. `references/PAPER_STRUCTURE.md`;
3. `references/MATH_REWRITE_CHECKLIST.md`.

Resolve them relative to this `SKILL.md`; do not substitute similarly named
files from another repository.

## Mathematical authority

The problem statement fixes the mathematical setting and target. The verified
blueprint fixes the proof. Preserve every hypothesis, conclusion, and
load-bearing implication. You may reorganize exposition, introduce notation
already implicit in the sources, and compress repeated prose. You must not:

- strengthen or weaken the theorem;
- invent a lemma, hypothesis, construction, or proof step;
- convert an assumed theorem into a theorem proved in the paper;
- replace a cover-level statement by a weaker base-group statement;
- fabricate a citation, author, title, venue, year, theorem number, or arXiv id;
- expose Rethlas logs, memory channels, verifier dialogue, internal paths, or
  workflow instructions in visible paper prose.

When the verified proof uses a nontrivial known input but no verified citation is
available, state it explicitly as a known input and leave the bibliography empty.
Never manufacture a reference to make the paper look finished.

## Drafting workflow

1. Extract the exact headline theorem and list its known inputs.
2. Choose the smallest adequate structure from `PAPER_STRUCTURE.md`. One theorem
   with a short proof is a note; do not pad it into a long paper.
3. Plan the logical order. Every symbol used in the theorem must be defined
   before the statement or in the statement itself.
4. Write one complete standalone `amsart` document to `main.tex`. Use a neutral
   author placeholder unless the user supplied author data. Omit acknowledgements
   unless the user supplied their text.
5. Turn blueprint headings and numbered workflow items into mathematical prose.
   The proof must read continuously as a proof, not as an execution trace.
6. Apply every item in `MATH_REWRITE_CHECKLIST.md`. Repair presentation errors by
   returning to the verified blueprint; do not fill a missing mathematical step
   from memory.

The paper should normally contain a title, abstract, introduction, mathematical
setup, the main theorem, its proof, and short scope remarks when they help the
reader. Include a bibliography only for references whose metadata and cited use
are supported by the supplied reference material.

## Compilation gate

Run:

```bash
bash .agents/skills/rethlas-blueprint-to-paper/scripts/compile_paper.sh \
  results/<problem_id>/paper/main.tex
```

The script runs XeLaTeX twice, preserves the complete final `main.log`, and
returns nonzero on fatal LaTeX or log-validation failures. Fix every reported
error before proceeding. Validation uses compiler exit status and the complete
log. Do not render PDF pages or perform visual inspection unless the user
explicitly asks for it.

## Paper-level mathematical verification

Treat the paper as a new mathematical artifact: the blueprint verdict does not
automatically verify the rewritten exposition.

After compilation, call `verify_proof_service` with:

- `statement`: the exact headline theorem, including its hypotheses, copied from
  the authoritative problem/verified blueprint;
- `proof`: the complete mathematical development from `main.tex`, including the
  setup, named known inputs, theorem, and proof.

If the verifier returns `wrong`, use its concrete findings to compare the paper
against `blueprint_verified.md`. Repair only mistranscription, dropped hypotheses,
missing definitions, or omitted verified steps. Do not add new mathematics. Run
the compile gate and paper verifier again after every repair. A verifier execution
error is not a passing verdict.

Write `paper_verification.md` with:

- `problem_id` and the authoritative blueprint path;
- the selected length tier;
- a statement that the rewrite checklist was applied;
- the compile command, exit status, and full log path;
- the paper verifier's exact verdict, critical errors/gaps or repair hints;
- unresolved citation or mathematical blockers;
- a note that no visual inspection was performed unless the user requested one.

Publication is complete only when `main.tex` compiles, `main.pdf` and `main.log`
exist, and the paper-level verifier returns `correct` with no critical errors or
gaps. Otherwise preserve the artifacts and report the precise blocker without
calling the paper verified.

