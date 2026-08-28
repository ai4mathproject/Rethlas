# theorem thm:minimal-good-lattice-splitting-normalization

## statement

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

## proof

For \(x'_1,x'_2\in\mathcal B(G')\) and \(g\in K_x\), the two elements
\(s_{x,x'_1}(g)\) and \(s_{x,x'_2}(g)\) project to the same element \(g\) of
\(\operatorname{Sp}(W)\). Their quotient therefore belongs to the central
kernel \(\mathbb C^\times\), so \(\xi_{x;x'_1,x'_2}\) is well defined and
continuous.

Write \(s_i=s_{x,x'_i}\) and \(\xi_{ij}=\xi_{x;x'_i,x'_j}\). Since
\(s_i(g)=\xi_{ij}(g)s_j(g)\) with \(\xi_{ij}(g)\) central, the homomorphism
property of \(s_i\) and \(s_j\) gives
\[
\begin{aligned}
\xi_{ij}(gh)s_j(g)s_j(h)
&=s_i(gh)=s_i(g)s_i(h)\\
&=\xi_{ij}(g)\xi_{ij}(h)s_j(g)s_j(h).
\end{aligned}
\]
Cancellation yields
\[
\xi_{ij}(gh)=\xi_{ij}(g)\xi_{ij}(h),
\]
so \(\xi_{ij}\) is a continuous character. Direct cancellation in the
central kernel gives
\[
\xi_{13}(g)
=s_1(g)s_3(g)^{-1}
=\bigl(s_1(g)s_2(g)^{-1}\bigr)
 \bigl(s_2(g)s_3(g)^{-1}\bigr)
=\xi_{12}(g)\xi_{23}(g),
\]
which proves the cocycle identity.

Now fix \(\Lambda'_0,\Lambda'_1\in\mathscr M(V')\). By the
minimal-good-lattice orbit theorem, choose \(a\in G'\) such that
\(\Lambda'_1=a\Lambda'_0\). Normalized-point equivariance gives
\[
x'_{\Lambda'_1}=a x'_{\Lambda'_0}.
\]
Put \(x'_0=x'_{\Lambda'_0}\), and choose any lift \(\widetilde a\) of
\(1\otimes a\) to \(\widetilde{\operatorname{Sp}}(W)\). Tensor-lattice
equivariance and generalized-lattice-model naturality give, for every
\(g\in K_x\),
\[
s_{x,a x'_0}(g)
=\widetilde a\,s_{x,x'_0}(g)\widetilde a^{-1}.
\tag{1}
\]
This is only the lattice-model conjugacy step. The element
\(s_{x,x'_0}(g)\) belongs to the pullback cover over \(G\), whereas
\(\widetilde a\) belongs to the pullback cover over \(G'\). The known
commuting-cover theorem therefore gives
\[
[\widetilde a,s_{x,x'_0}(g)]=1.
\]
Substitution into (1) yields
\[
s_{x,a x'_0}(g)=s_{x,x'_0}(g).
\]
Using \(x'_{\Lambda'_1}=a x'_0\), we conclude that
\[
s^{\min}_{x,\Lambda'_1}(g)
=s^{\min}_{x,\Lambda'_0}(g)
\qquad(g\in K_x).
\]
Thus the splittings agree as maps. Their common value is a continuous
group-homomorphic splitting \(s_x^{\min}\), because every \(s_{x,x'}\) has
those properties by construction.

For arbitrary \(x'\), the formula
\[
\xi_{x,x'}(g)
=s_x^{\min}(g)\bigl(s_{x,x'}(g)\bigr)^{-1}
\]
is the preceding comparison construction with the first splitting equal to
\(s_x^{\min}\). Hence \(\xi_{x,x'}\) is a continuous
\(\mathbb C^\times\)-valued character, and rearranging its definition gives
\[
s_x^{\min}=\xi_{x,x'}s_{x,x'}.
\]
Finally, the same definitions give
\[
\begin{aligned}
\xi_{x,x'_1}^{-1}(g)\xi_{x,x'_2}(g)
&=\bigl(s_{x,x'_1}(g)(s_x^{\min}(g))^{-1}\bigr)
  \bigl(s_x^{\min}(g)(s_{x,x'_2}(g))^{-1}\bigr)\\
&=s_{x,x'_1}(g)(s_{x,x'_2}(g))^{-1}\\
&=\xi_{x;x'_1,x'_2}(g).
\end{aligned}
\]
If \(x'=x'_{\Lambda'}\) comes from a minimal good lattice, then
\(s_{x,x'}=s_x^{\min}\), so \(\xi_{x,x'}=1\). No descent, quadraticity, or
finite determinant formula follows from this formal comparison alone.
