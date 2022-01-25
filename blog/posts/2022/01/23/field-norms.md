@def isblogpost = true

# Field Norms

In reading Larry Groves book
  _Classical Groups and Geometric Algebra_\cite{Grove 2002},
  I ended up needing to review (well, really _learn_ about)
  norms of field extensions.
Finding their properities listed somewhere was easy enough,
  but proofs of these properties seemed hard to come by
  or were relegated to exercises.
So, I resolved to figure it out myself.
Perhaps these proofs are standard,
  but I found them interesting enough to want to share here.

Many of the necessary little field theory facts
  are taken from Dummit & Foote\cite{Dummit & Foote 2004}.


## Norm as a Determinant

\begin{aside}
  We will only consider finite field extensions throughout.
  Some of this may be applicable in more generality,
  but I don't really care right now.
\end{aside}
For given a field extension $L/K$,
  we can notice that $x \mapsto ax$ for $a, x \in L$
  is a $K$-linear transformation.
It seems natural then to consider the determinant of this,
\[
    N_{L/K}(a) = \det\!{}_K(x \mapsto ax),
\]
  and we'll call this the _norm_ of $a$ in $L/K$.
From this definition,
  we can see immediately that for any $k \in K$ and $b \in L$,
\[\label{eq: norm is det}
    N_{L/K}(k) = k^{[L:K]},\quad
    N_{L/K}(ab) = N_{L/K}(a)N_{L/K}(b).
\]

## Minimal & Characteristic Polynomials

Let $m_a(x) = ax$.
Composition powers of $m_a$ are just powers of $a$,
  so if $p \in K[x]$ is the minimal polynomial for $a$
  then $p(a) = 0$ means that
\aside{
  By $p(m_a),$ we mean substituting $m_a$ for $x$
  and interpreting powers as repeated composition of $m_a.$
  If you're unconvinced,
  try choosing a random polynomial for $p$
  and convincing yourself that $[p(m_a)](x) = p(a)x.$
}
  $p(m_a) = 0$ as well.
But since $p$ is monic and irreducible,
  by definition it's also be minimal polynomial for $m_a$
  in the linear algebra sense!
So (by the Cayley-Hamilton Theorem) it must have the same roots
  (not counting multiplicity)
  as the characteristic polynomial for $m_a$,
  i.e. the eigenvalues of $m_a$.

\newcommand{\prim}{\sqrt[3]{2}}
\newcommand{\primII}{\sqrt[3]{4}}

To expand on this, let's think about the matrix of $[a]_{L/K}$ of $m_a$,
  and for clarity let's consider the particular case of
\[
    L = \Q(\prim),\quad K = \Q,\quad [L:K] = 3.
\]
An element in this field is of the form
\[\label{eq: coords}
  a = \alpha + \beta\prim + \gamma\primII,\quad
\]
for $\alpha, \beta, \gamma \in \Q$.
Then in general,
  writing this as a vector $(\alpha, \beta, \gamma)\trans$
  we can convince ourselves that
\[
    [a]_{L/K} = \begin{pmatrix}
        \alpha & 2\gamma & 2\beta   \\
        \beta  & \alpha  & 2\gamma \\
        \gamma & \beta   & \alpha  \\
    \end{pmatrix}.
\]
The field norm is then the determinant of this matrix,
  which we can find to be
\[
    N_{\Q(\prim)/\Q}(a) = \alpha^3 + 2\beta^3 + 4\gamma^3 - 6\alpha\beta\gamma.
\]
For the case of $a = \prim$ we have $(\alpha,\beta,\gamma) = (0,1,0),$
  the minimal polynomial is $p(x) = x^3 - 2,$
  and $[a]_{L/K}$ takes the particular form
\[
    [a]_{L/K} = \begin{pmatrix}
        0 & 0 & 2 \\
        1 & 0 & 0 \\
        0 & 1 & 0 \\
    \end{pmatrix}.
\]
In this case, computing $[a]_{L/K}^3$ is easy, and indeed $p([a]_{L/K}) = 0.$

Now, the determinant of $[a]_{L/K}$ is the product of its eigenvalues.
However, those don't necessarily _exist_.
What we can do, though, is think of our coordinate space $\Q^3$
  as living in $M^3$ where $M$ is a splitting field of $a.$
__Notice how this doesn't change the determinant__ of $[a]_{L/K}.$
In this setting, $[a]_{L/K}$ does indeed have a full set of eigenvalues.
Explicitly taking $M = \C$ and setting 
\[
    x^3 - 2
    = (x - \prim)(x - \prim\zeta)(x - \prim\zeta\conj).
\]
where $\zeta = e^{2\pi/3}$ and $\zeta\conj$ is the conjugate.
The determinant, i.e. the norm, is then their product:
\[
  N_{\Q(\prim)/\Q}(\prim)
  = (\prim)(\prim\zeta)(\prim\zeta\conj) = 2.
\]

Notice how we can use $p$ to get the eigenvalues of $m_a$
  and hence compute the norm.
However, there is a an issue:
  while it worked out in this example,
\aside{
  More precisely, it could be _lacking_ multiplicity
  for some or all eigenvalues,
  and this manifests as the degree of $p$ differing from $[L:K].$
}
  $p$ does _not_ have to be the same
  as the characteristic polynomial for $m_a$

## Norm in an Extension Tower

At least when the degree of $p$ is $[L:K]$
  we have a recipe to compute the norm of $a$:
  it's the product of the roots of $p$
  (in a field extension where it splits).
Otherwise, though, we're going to have to work a little harder.
What will help us is to figure out, given an extension $M/L,$
  how $N_{M/L}$ and $N_{M/K}$ relate to $N_{L/K}.$

It will be easiest to return to our example, so let's do so
\aside{
  $\zeta$ gives us $\zeta\conj = -(1 + \zeta)$
  and so $[M:K] = [M:L][L:K] = 2\cdot3 = 6$.
}
  and choose $M = \Q(\prim,\zeta).$
However, now we're going to look at $[b]_{M/K}$
  for, say, $b = \primII + \prim\zeta$,
  and we're going to organize our coordinates
  for an arbitrary $x \in M$ in a "natural" way:
\[\label{eq: split coords}
    (\alpha_{11} + \alpha_{12}\prim + \alpha_{13}\primII)
    + (\alpha_{21} + \alpha_{22}\prim + \alpha_{23}\primII)\zeta
\]
so that
  $(\alpha_{11},\alpha_{12},\alpha_{13},
    \alpha_{21},\alpha_{22},\alpha_{23})\trans$
  is our coordinate vector.
This is natural because an element of $M$
  is expressible in $M/L$
  as $l_1 + l_2\zeta$ with $l_1, l_2 \in L$,
  but each of $l_1, l_2$ is expressible in $L/K$ as \eqref{eq: coords},
  hence \eqref{eq: split coords}.
Our matrix is then
\[\label{eq: a M/K}
    [b]_{M/K} = \left(\begin{array}{ccc|ccc}
        0 & 2 & 0 &   0 & 0 & 2 \\
        0 & 0 & 2 &   1 & 0 & 0 \\
        1 & 0 & 0 &   0 & 1 & 0 \\ \hline

        0 & 0 & 2 &   0 & 2 & 0 \\
        1 & 0 & 0 &   0 & 0 & 2 \\
        0 & 1 & 0 &   1 & 0 & 0
    \end{array}\right).
\]
The virtue of the coordinate grouping \eqref{eq: split coords}
  is that __consecutive groups of three coordinates
  are coordinates for elements of $L.$__
The blocks shown in the matrix reflect this.
We could then look at $[b]_{M/L},$ $[\prim]_{M/L},$ and $[\primII]_{M/L}$
  and see that
\[
    [\prim]_{L/K} = \begin{pmatrix}
        0 & 0 & 2 \\
        1 & 0 & 0 \\
        0 & 1 & 0
    \end{pmatrix},\quad
    [\primII]_{L/K} = \begin{pmatrix}
        0 & 2 & 0 \\
        0 & 0 & 2 \\
        1 & 0 & 0
    \end{pmatrix}
\]
\begin{aside}
  Remember that $\prim$ is a scalar in $M/L$!
\end{aside}
\[
    [b]_{M/L} = \primII[1]_{M/L} + \prim[\zeta]_{M/L} = \begin{pmatrix}
        \primII & \prim  \\
        \prim & \primII \\
    \end{pmatrix},
\]
and realize that, by our choice of coordinates,
  $[b]_{M/K}$ is exactly what we get when we substitute $[\prim]_{L/K}$
  for $\prim$ and $[\primII]_{L/K}$ for $\primII$ in $[b]_{M/L}.$
This makes sense:
  $[\_]_{X/Y}$ for whatever fields $X, Y$ is a
\aside{
  Faithful meaning "in bijection with $L$" and representation meaning
  $[xy] = [x][y]$ and $[x+y] = [x]+[y]$ for any $x, y \in L.$
}
  faithful representation of the field $X.$
When looking at $[\_]_{M/K},$
  because of the block-structure of matrix multiplication
  we can just use the $[\_]_{L/K}$ representation
  for our $L$-elements inside $[\_]_{M/L}.$
We can carry out this procedure for any $M, L, K, b$
  by making an analogous choice of coordinates.

\begin{aside}
  This comes from the observation
  that you can calculate the determinant
  by performing Gaussian elimination
  on such a matrix block-wise,
  essentially treating the blocks like scalars.
  Notice for example that multiplying the first block-row 
  of a block-matrix $X$ by a block $A$ (to get the block-matrix $Y$)
  is the same as multiplying $X$ on the left
  by the block-matrix $Z$ which has $A$ in the top-left corner
  and ones along the rest of the diagonal;
  then $\det(Z) = \det(A)$ and so $\det(Y) = \det(ZX) = \det(A)\det(X)$,
  just as if $A$ was a "scalar".
  A full exposition takes us too far from the main topic,
  so we won't go into it here.
\end{aside}
Everything now falls into place.
The determinant of a block matrix
  with invertible commuting blocks of the same size
  is the determinant of the "determinant of the blocks",
  meaning for example that
\[
  \left|\begin{array}{c|c}
      A & B \\ \hline
      C & D
  \end{array}\right|
  = \det(AD - BC)
\]
where $A, B, C, D$ are appropriate matrices.
The punchline is then
\[
    \det\!{}_K([b]_{M/K})
    = \det\!{}_K\Bigl(\bigl[\det\!{}_L([b]_{M/L})\bigr]_{L/K}\Bigr).
\]
We take the block-wise determinant of $[b]_{M/K}$ to get
  $[\det\!{}_L([b]_{M/L})]_{L/K}$ since the blocks represent elements of $L$,
  then $\det\!{}_K([b]_{M/K})$ is the determinant of this
  by the "determinant of the determinant of blocks" property.

In terms of norms we finally reveal, for any $b \in M$,
\[
    N_{M/K}(b) = N_{L/K}\bigl(N_{M/L}(b)\bigr)
    \implies N_{M/K} = N_{L/K} \circ N_{M/L}.
\]
We also get a nice way of computing norms in general.
Consider the extension tower $L/K(a)/K.$
Noting particularly that $a \in K(a)$ gives
\[\label{eq: split norm}\begin{aligned}
    N_{L/K}(a)
    &= N_{K(a)/K}\bigl(N_{L/K(a)}(a)\bigr)
     = N_{K(a)/K}(a^{[L:K(a)]}) \\
    &= \bigl(N_{K(a)/K}(a)\bigr)^{[L:K(a)]}.
\end{aligned}\]
But $[K(a):K]$ is the degree of $p,$
  the minimal polynomial of $a$ and $[a]_{K(a)/K}.$
Every polynomial $q$ with $[a]_{K(a)/K}$ as a root
  must be divisible by $p$ by definition;
  by the Cayley-Hamilton Theorem,
  the characterisitic polynomial of $[a]_{K(a)/K}$ is such a polynomial,
  and it has degree $[K(a):K]$, the same as $p$;
  hence they must have exactly the same roots including multiplicity.
Thus $N_{K(a)/K}(a)$ is the product
  of the roots $x_1,\dotsc,x_{\deg(p)}$ of $p,$
  and together with \eqref{eq: split norm} we finally have
\[\label{eq: compute norm}
    N_{L/K}(a)
    = \Bigl(x_1x_2\cdots x_{\deg(p)}\Bigr)^{[L:K]/\deg(p)},
\]
where we've made use of the fact that
\[
    [L:K] = [L:K(a)][K(a):K] = [L:K(a)]\deg(p).
\]

## Norm in a Galois Extension

\newcommand{\Gal}{\mathrm{Gal}}

In the case that $L/K$ is Galois,
  we get a particularly nice form for the norm.
Since we're in a Galois extension,
  $p$ splits, it's roots are distinct, and they are exactly given by the set
\[
    \{\sigma(a) \;\mid\; \sigma \in \Gal(L/K)\}.
\]
Note, crucially,
  that there may be more than one element of $\Gal(L/K)$
  that maps $a$ to a particular root.
What we will do is count these repetitions.

Let $H \subseteq \Gal(L/K)$ be the stabilizer of $a.$
Then for any $\sigma, \sigma'$ in the same coset of $H,$
\[
    \sigma\inv\sigma'
    \in (\sigma\inv\sigma')H = \sigma\inv(\sigma'H) = \sigma\inv(\sigma H) = H
\]\[
    \implies (\sigma\inv\sigma')(a) = a \implies \sigma'(a) = \sigma(a).
\]
Thus every coset of $H$ corresponds exactly to the _distinct_ values
  that $\Gal(L/K)$ can map $a$ to.
The field fixed by $H$ is $K(a),$
  so since this is a Galois extension the size and number of the cosets are
\[
    |H| = [L:K(a)],\quad |G/H| = [K(a):L].
\]
This is all to say that,
  for $\Gal(L/K) = \{1, \sigma_1, \sigma_2,\dotsc, \sigma_n\},$
  the sequence $a, \sigma_1(a), \sigma_2(a), \dotsc, \sigma_n(a)$
  repeats each of the $[K(a):L] = |G/H|$ distinct roots of $p$
  exactly $|H| = [L:K(a)]$ times.
Since $p$ has _only_ distinct roots,
  putting this all together in \eqref{eq: compute norm}
  finally gives
\[
    N_{L/K}(a) = \prod_{\sigma \in \Gal(L/K)}\sigma(a).
\]

## Summary
* The field norm is a multiplicative function,
  and a power function over the base field
  with power the index of the extension.
* The norm over a tower of field extensions
  is the composition of norms going down the tower.
* The norm is always the product of all the roots of the minimal polynomial $p,$
  all raised to the $\text{index}/\!\deg(p)$ power.
* In a Galois extension,
  the norm is the product of all the Galois conjugates.

# References
\bibentry{Dummit & Foote 2004}{1}
D.S. Dummit, R.M. Foote, _Abstract Algebra_. Third edition.
John Wiley & Sons, Inc., Hoboken, 2004.

\bibentry{Grove 2002}{2}
L.C. Grove, _Classical Groups and Geometric Algebra_,
American Mathematical Society, Providence, 2002.
