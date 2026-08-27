# Rethlas Blueprint-to-Paper Skill Design

## Goal

Add a Rethlas-native Codex skill named `rethlas-blueprint-to-paper` that turns a
verified Rethlas proof blueprint into a readable, standalone mathematical paper.
The skill must not depend on the Danus fact graph, worker swarm, or `paper_write`
MCP service.

## Target layout

The skill lives at

```text
agents/generation/.agents/skills/rethlas-blueprint-to-paper/
```

It contains:

- `SKILL.md`: entry point, gates, workflow, and output contract;
- `references/STYLE_GUIDE.md`: field-neutral mathematical writing rules adapted
  from Danus;
- `references/PAPER_STRUCTURE.md`: the short-paper section plan;
- `references/MATH_REWRITE_CHECKLIST.md`: semantic-preservation checks;
- `scripts/compile_paper.sh`: deterministic two-pass XeLaTeX compilation and
  log validation.

## Input contract

The caller supplies a Rethlas `problem_id`. The skill resolves:

```text
data/<problem_id>.md
results/<problem_id>/blueprint_verified.md
data/<problem_id>.refs/                 # optional
```

The skill refuses to write a paper if `blueprint_verified.md` is absent. The
original problem statement and verified blueprint are authoritative. Reference
files are supporting context only and must not be promoted to verified facts.

## Output contract

All paper artifacts are isolated under:

```text
results/<problem_id>/paper/
```

The required outputs are:

- `main.tex`: standalone `amsart` source;
- `main.pdf`: compiled paper;
- `main.log`: complete LaTeX log from the final pass;
- `paper_verification.md`: a concise record of input provenance, mathematical
  consistency checks, compilation status, and any unresolved caveats.

Intermediate files stay in the same paper directory and may be removed after
successful compilation, except for `main.log`.

## Paper transformation

The generated paper is an exposition, not a transcript. It must remove Rethlas
workflow language, memory records, verifier messages, fact identifiers, and
blueprint instructions. It should normally contain:

1. title and abstract;
2. introduction and statement of the result;
3. mathematical setup and notation;
4. explicitly identified known inputs;
5. the main theorem and a coherent proof;
6. short remarks on logical scope when useful;
7. references only when supported by supplied reference material.

The writer may reorganize and compress exposition but may not strengthen a
hypothesis, invent a lemma, supply a missing proof, or manufacture a citation.
If the verified argument treats a nontrivial theorem as an input, the paper must
say so. If no verified bibliographic source is supplied, it must use wording such
as "we use the following known theorem" rather than fabricate a bibliography
entry.

## Mathematical consistency gate

Before compilation, the skill compares `main.tex` against the verified
blueprint and checks that:

- the headline theorem has the same hypotheses and conclusion;
- every load-bearing proof step is present;
- known inputs remain inputs rather than silently becoming proved claims;
- no Rethlas-private workflow text leaks into the paper;
- no unsupported citation or bibliographic metadata is introduced.

For the minimal-good-lattice example, the paper must distinguish the two
load-bearing steps: generalized-lattice-model naturality gives conjugacy, while
the known commuting-cover theorem turns that conjugacy into equality.

After compilation, the existing Rethlas proof-verification service is invoked on
the paper's theorem and proof when that service is available. A verifier failure
blocks publication of a clean `paper_verification.md`; it does not authorize the
writer to add new mathematics.

## Compilation gate

`scripts/compile_paper.sh` runs XeLaTeX twice with `-halt-on-error` and
`-file-line-error`, preserves the complete final log, and fails on:

- LaTeX errors or emergency stops;
- undefined control sequences;
- missing files or missing glyphs;
- unresolved references;
- overfull boxes.

Underfull boxes are recorded for review but do not automatically fail unless
the log indicates a severe or repeated problem. Following the active project
requirement, validation is based on exit status and complete logs; the skill
does not render pages or perform visual inspection unless the user explicitly
requests it.

## Integration

Rethlas generation instructions will mention the skill as an optional
post-verification stage. It is never run before the canonical proof verifier has
published `blueprint_verified.md`, and ordinary proof-generation runs remain
unchanged unless the user asks for a paper.

## Validation

Migration is complete when:

1. the skill passes Codex skill-frontmatter and target validation;
2. its support files resolve from the skill directory without Danus paths;
3. a fixture based on an existing verified Rethlas blueprint produces
   `main.tex`, `main.pdf`, `main.log`, and `paper_verification.md`;
4. the compile script returns zero and its full-log scan reports no fatal issue;
5. the generated paper contains no fact ids, Rethlas memory language, verifier
   transcript, or fabricated citation.

