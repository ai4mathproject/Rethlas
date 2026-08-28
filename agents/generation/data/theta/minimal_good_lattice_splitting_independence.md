# Minimal-good-lattice splitting normalization

## 1. Setting

Let \(F\) be a non-archimedean local field of odd residual characteristic,
and let
\[
(G,G')=(U(V,h),U(V',h'))\subseteq\operatorname{Sp}(W)
\]
be the type-I reductive dual pair under consideration. Work in the universal
\(\mathbb C^\times\)-metaplectic extension
\[
1\longrightarrow\mathbb C^\times
\longrightarrow\widetilde{\operatorname{Sp}}(W)
\longrightarrow\operatorname{Sp}(W)
\longrightarrow1.
\]

Fix \(x\in\mathcal B(G)\) and put
\[
K_x:=\operatorname{Stab}_G(x).
\]
The building has been refined so that \(K_x\) is constant on each open
facet. For every \(x'\in\mathcal B(G')\), the generalized lattice model
attached to the tensor lattice function \(\mathcal B_{x,x'}\) supplies a
continuous group-homomorphic splitting
\[
s_{x,x'}:K_x\longrightarrow\widetilde{\operatorname{Sp}}(W).
\]
Existence and multiplicativity of these splittings are known inputs.

For \(x'_1,x'_2\in\mathcal B(G')\), define
\[
\xi_{x;x'_1,x'_2}(g)
:=s_{x,x'_1}(g)\bigl(s_{x,x'_2}(g)\bigr)^{-1},
\qquad g\in K_x.
\]
The quotient lies in the central copy of \(\mathbb C^\times\).

## 2. Known inputs for the minimal normalization

The following results may be used directly.

1. The nonempty set \(\mathscr M(V')\) of minimal good lattices is one
   \(G'\)-orbit. Each \(\Lambda'\in\mathscr M(V')\) determines a normalized
   building point \(x'_{\Lambda'}\), and
   \[
   x'_{a\Lambda'}=a\,x'_{\Lambda'}
   \qquad(a\in G').
   \]
2. Tensor-lattice equivariance gives
   \[
   \mathcal B_{x,ax'}=(1\otimes a)\mathcal B_{x,x'}.
   \]
3. Generalized-lattice-model transport by \(1\otimes a\) gives an
   isomorphism
   \[
   T_a:\mathcal H_{x,x'}\longrightarrow\mathcal H_{x,ax'}
   \]
   and, for any lift \(\widetilde a\) of \(1\otimes a\), the cover-level
   conjugacy identity
   \[
   s_{x,ax'}(g)
   =\widetilde a\,s_{x,x'}(g)\widetilde a^{-1}
   \qquad(g\in K_x).
   \]
4. The pullback covering groups over \(G\) and \(G'\) commute elementwise
   inside \(\widetilde{\operatorname{Sp}}(W)\) in the present dual-pair
   setting. This is a known nontrivial cover-level theorem and is not to be
   reproved from commutativity in the base symplectic group.

For \(\Lambda'\in\mathscr M(V')\), put
\[
s^{\min}_{x,\Lambda'}:=s_{x,x'_{\Lambda'}}.
\]

## 3. Target theorem

Prove all of the following statements.

1. For every \(x'_1,x'_2\in\mathcal B(G')\),
   \[
   \xi_{x;x'_1,x'_2}:K_x\longrightarrow\mathbb C^\times
   \]
   is a continuous character, and for every \(x'_1,x'_2,x'_3\),
   \[
   \xi_{x;x'_1,x'_3}
   =\xi_{x;x'_1,x'_2}\,\xi_{x;x'_2,x'_3}.
   \]

2. For every \(\Lambda'_0,\Lambda'_1\in\mathscr M(V')\),
   \[
   s^{\min}_{x,\Lambda'_0}=s^{\min}_{x,\Lambda'_1}
   \]
   as continuous group-homomorphic splittings. Hence their common value
   defines a canonical splitting
   \[
   s_x^{\min}:K_x\longrightarrow\widetilde{\operatorname{Sp}}(W).
   \]
   The proof must distinguish lattice-model conjugacy from the separate use
   of the known commuting-cover theorem.

3. For arbitrary \(x'\in\mathcal B(G')\), define
   \[
   \boxed{\quad
   \xi_{x,x'}(g)
   :=s_x^{\min}(g)\bigl(s_{x,x'}(g)\bigr)^{-1},
   \qquad g\in K_x.
   \quad}
   \]
   Prove that \(\xi_{x,x'}\) is a continuous
   \(\mathbb C^\times\)-valued character and that
   \[
   \boxed{\quad s_x^{\min}=\xi_{x,x'}\,s_{x,x'}.\quad}
   \]
   Moreover,
   \[
   \xi_{x;x'_1,x'_2}
   =\xi_{x,x'_1}^{-1}\xi_{x,x'_2},
   \]
   and \(\xi_{x,x'_{\Lambda'}}=1\) for every minimal good lattice
   \(\Lambda'\).

The theorem stops at this formal normalization. Do not assert without a
separate proof that \(\xi_{x,x'}\) is trivial on \(K_x^+\), factors through
\(K_x/K_x^+\), is quadratic, or equals a determinant product on a finite
graded quotient.
