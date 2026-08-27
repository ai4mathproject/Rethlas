# Structure of a Rethlas-derived mathematics paper

Choose the smallest structure that presents the verified argument honestly. Page
count is secondary to logical shape.

## 1. Length tier

### Tier A: short note

Use a short note for one headline theorem, a shallow proof, and little shared
machinery. This is the default for a single verified blueprint such as an
independence or normalization lemma.

### Tier B: mid-length paper

Use a mid-length paper for one main theorem with several genuine supporting
results, two related headline theorems, or enough standing machinery to require a
separate preliminaries section.

Do not create a long-paper tier unless the user asks for a multi-result article.
If uncertain between the two tiers, choose the short note.

## 2. Short-note recipe

Write the document in this order:

1. `amsart` preamble and theorem environments;
2. title, neutral or user-supplied author block, subject classification,
   keywords, and empty date;
3. a one- to three-sentence abstract beginning with the result;
4. `\section{Introduction}` with one context paragraph, the exact main theorem,
   and a short paragraph explaining the proof's decisive mechanisms;
5. `\section{Setup and known inputs}` defining the ambient objects and stating
   every external input used in the proof;
6. `\section{Independence theorem}` containing the proof in coherent prose;
7. a `remark` explaining the logical scope when the proof deliberately leaves a
   nontrivial input unproved;
8. a bibliography only if at least one supplied reference has been verified and
   cited.

Avoid a roadmap, appendix, or separate notation section unless the note actually
needs it. Do not repeat the main theorem under a second label.

## 3. Mid-length recipe

Write the document in this order:

1. front matter and a three- to five-sentence abstract;
2. introduction with context, headline theorem(s), method, and a one-paragraph
   roadmap when there are more than two body sections;
3. preliminaries containing standing notation, definitions, and known inputs;
4. preparatory results in dependency order;
5. the main theorem section after every internal prerequisite it uses;
6. scope remarks and applications supported by the verified source;
7. acknowledgements only when supplied by the user;
8. verified bibliography.

Each supporting theorem or lemma must come from the verified source. Do not split
one continuous proof into artificial named results merely to resemble a longer
paper.

## 4. Known inputs

A known input has three parts:

1. its exact mathematical statement in the notation of the paper;
2. its role in the proof;
3. a precise citation when supplied and verified, or an explicit statement that
   it is being used as a known theorem when no verified citation is available.

Do not include a proof sketch for an external input unless that sketch is part of
the verified blueprint. A logically essential cover-level theorem must not be
replaced by a weaker statement about the base group.

## 5. Proof architecture

Order the proof by logical dependence, not by the order in which an automated
system discovered the steps. For a short conjugacy-to-equality proof, the natural
order is:

1. choose an element relating the two auxiliary choices;
2. identify the corresponding geometric or lattice data;
3. apply model naturality to obtain a conjugacy identity;
4. apply the separate commuting-cover theorem to trivialize that conjugation;
5. conclude pointwise equality and hence equality of splittings;
6. record continuity and homomorphism from the original construction.

The paper must name the source of each transition. Do not merge steps 3 and 4.

## 6. Final scope remark

When the result is conditional on named known inputs, add one concise remark after
the proof. It should say what was proved from those inputs and which nontrivial
input was deliberately not reproved. It should not discuss agents, verification,
or workflow.
