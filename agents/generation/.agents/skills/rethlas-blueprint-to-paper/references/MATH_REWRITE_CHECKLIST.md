# Mathematical rewrite checklist

Apply this checklist after drafting `main.tex` and before compilation.

## Statement fidelity

- The ambient field, groups, spaces, extensions, and compact subgroup agree with
  the problem statement.
- The theorem has exactly the hypotheses and conclusion of the verified
  blueprint.
- Every symbol in the theorem is defined before use or within the statement.
- A continuous group-homomorphic splitting, its representation space, its
  Heisenberg action, and its symplectic action remain notationally distinct.

## Proof fidelity

- Every load-bearing implication in `blueprint_verified.md` appears in the paper.
- Conjugacy is not silently replaced by equality.
- Equality obtained from a known commuting-cover theorem is attributed to that
  theorem, not to commutativity in the base symplectic group.
- A twisted transport operator is not described as an identity-model
  intertwiner.
- A known nontrivial input remains an input; the paper does not claim to prove
  it.
- No central correction scalar is restricted to a smaller subgroup without a
  proof in the verified blueprint.

## Expository integrity

- The proof is coherent prose rather than a blueprint, verifier transcript, or
  list of agent actions.
- No internal path, problem id, memory channel, model name, verdict protocol, or
  tool instruction occurs in visible paper prose.
- No theorem, lemma, definition, example, or remark has been invented for
  narrative convenience.
- No step is dismissed with `clearly`, `obviously`, `trivially`, or an unnamed
  `standard argument`.

## References

- Every `\cite{...}` has a supported bibliography entry in supplied reference
  material.
- Every bibliography entry has supported authors, title, year, and source.
- If a citation cannot be verified, it is omitted and the result is identified
  only as a known input.
- An empty bibliography is preferable to a fabricated or guessed citation.

## Output hygiene

- `main.tex` is a complete standalone `amsart` document.
- All custom control sequences are declared.
- Every `\ref` and `\eqref` has a matching label.
- The abstract contains no citations and does not overload notation.
- The author block is user-supplied or an explicit neutral placeholder.
