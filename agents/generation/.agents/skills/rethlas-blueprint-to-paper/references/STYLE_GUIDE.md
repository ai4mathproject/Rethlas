# House style for a Rethlas-derived mathematics paper

This guide governs the prose and LaTeX form of a paper obtained from a verified
Rethlas blueprint. The original problem and verified blueprint remain the
mathematical authority.

## 1. Integrity floor

Preserve the mathematics exactly. Keep every hypothesis, conclusion, and
load-bearing proof step. Reorganization is allowed; mathematical invention is
not. Do not fabricate a reference, author, attribution, theorem locator, venue,
year, or identifier. Do not expose proving-system metadata in visible prose.

If the blueprint relies on a known theorem whose reference has not been supplied
and checked, call it a known input. Do not give it a guessed citation. If a gap
appears during rewriting, return to the verified blueprint. If the blueprint does
not contain the missing step, record a blocker rather than supplying a new proof.

## 2. Document form

- Use `\documentclass[11pt]{amsart}` unless the user requests another class.
- Load only packages that the paper uses. A typical short note needs `amsmath`,
  `amssymb`, `amsthm`, `mathtools`, and `hyperref`.
- Define theorem environments with one section-level counter. Use `theorem`,
  `lemma`, `proposition`, `corollary`, `definition`, and `remark` only when the
  exposition needs them.
- Include `\subjclass[2020]{...}`, `\keywords{...}`, and an empty `\date{}`.
- Use a neutral author placeholder unless the user supplied author information.
  Never invent an affiliation or email address.
- Omit acknowledgements unless the user supplied acknowledgement text.

## 3. Notation

- Define every symbol before its first use in a theorem statement.
- Use `\colon` in maps, `\mid` in set-builder notation, and
  `\DeclareMathOperator` for multi-letter operators.
- Keep a representation, its representation space, its Heisenberg action, its
  symplectic action, and a covering-group element notationally distinct.
- Keep the notation of the problem and blueprint unless a local abbreviation
  materially improves readability. State every abbreviation explicitly.

## 4. Theorem statements

- The main theorem must have exactly the hypotheses and conclusion of the
  verified source.
- Use an accessible English optional title when helpful. Do not put an undefined
  symbol in a title.
- Known inputs are stated before the main theorem or immediately before the proof.
  Make their logical status explicit: they are assumed results, not contributions
  proved by the note.
- Do not promote an expository observation into a new lemma unless it is already a
  result in the verified blueprint.

## 5. Proofs

- Choose cohesive prose for a short argument. Use `Step 1`, `Step 2`, and so on
  only when the proof has genuinely separate stages.
- State one mathematical claim per sentence. Justify every non-immediate claim by
  a formula, a previously stated input, or an exact citation.
- Do not write `clearly`, `obviously`, `trivially`, `by the same argument`, or
  `by a standard argument` in place of a reason.
- Distinguish implications that have different logical sources. In particular,
  an equivariant transport may yield conjugacy while a separate cover-level
  theorem yields equality.
- A twisted intertwiner is not an identity-model intertwiner. Do not erase the
  symplectic action involved in transport.
- If two lifts differ by a central scalar, say why that scalar does or does not
  affect the conjugation being used.

## 6. Citations and bibliography

- Include `\cite{...}` only when supplied reference material supports the exact
  bibliographic metadata and the asserted use.
- Prefer a precise locator such as `\cite[Theorem~2.1]{Key}` when it is known.
- Use a manual `thebibliography` and sort entries by author surname.
- List only cited works. If no citation has been verified, omit the bibliography.
- Never disguise a missing citation with fabricated metadata or a vague author
  attribution.

## 7. Cross-references and prose

- Use typed references: `Theorem~\ref{...}`, `Lemma~\ref{...}`, and
  `Section~\ref{...}`. Use `\eqref{...}` for equations.
- Prefer short sentences and direct verbs: `we prove`, `we show`, `it follows`,
  `hence`, and `therefore`.
- The abstract opens with `We prove` or a close variant, contains no citations,
  and avoids notation beyond what a reader needs to identify the result.
- The introduction explains the question, the result, and the two or three
  decisive proof mechanisms. It does not recount the proving process.
- Do not mention a blueprint, verifier, prompt, memory channel, model, tool,
  problem id, file path, or verdict in visible paper prose.

## 8. LaTeX hygiene

- Declare every custom command before use.
- Balance all braces and environments.
- Give every referenced theorem, section, and equation a unique label.
- Do not leave unresolved editorial markers or placeholder citations in a paper
  reported as complete.
- Treat compiler errors, undefined references, missing glyphs, and overfull boxes
  as failures to repair before delivery.

