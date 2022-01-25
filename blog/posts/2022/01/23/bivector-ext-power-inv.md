@def isblogpost = true

\newcommand{\B}{\mathcal B}

# Inverses of Exterior Powers of a Bivector

\begin{aside}
  \cite{Roelfs DeKeninck 2021} [https://arxiv.org/abs/2107.03771v1]()
\end{aside}
In their recent paper \cite{Roelfs DeKeninck 2021},
  Roelfs and De Keninck present
  a very intriguing coordinate-free decomposition of any bivector $B$
  into a sum of a particular class of simple bivectors
  for _any_ Clifford algebra over a real vector space $V$.
In their proof,
  it's necessary at the final step to invert the multivector $D$ where
\[
    D := \begin{cases}
        \lambda^{r-1}W_1 + \lambda^{r-2}W_3 + \cdots + W_{k-1}
            &\text{if }k\text{ is even}, \\
        \lambda^rW_0 + \lambda^{r-1}W_2 + \cdots + W_{k-1}
            &\text{if }k\text{ is odd},
    \end{cases}
\]\[
    W_m := \frac1{m!}\underbrace{B\meet B\meet\cdots\meet B}_{m\text{ times}},
\]\[
    n = \dim(V),\quad k = \lfloor n/2\rfloor,\quad r = \lfloor k/2\rfloor,
\]
and $\lambda$ is a particular constant.
However, they don't give any indication
  as to why this multivector is invertible.

As a first step, we can try finding the inverse of
\[
    \B_m := \underbrace{B\meet B\meet\cdots\meet B}_{m\text{ times}},
\]
    and all of us would feel warm and fuzzy inside if it were
\[\label{eq:inductive goal}
    \B_m\inv \overset?= A_m
     := \underbrace{B\inv\meet B\inv\cdots\meet B\inv}_{m\text{ times}},
\]
  and it is!

...maybe.
I'll show that when $\B_m\inv$ \sep _does_ exist,
  then it must be $A_m$.
But it's not clear to me how to show that $\B_m\inv$ \sep _must_ exist.
Perhaps I'm just missing something basic here, though.

We will show \eqref{eq:inductive goal} by induction on $m$.
The base case is very short and sweet: $\B_1\inv = B\inv$ by definition!
So now suppose that $\B_m\inv = A_m$.
By the defining property of contractions,
\[
    1 = \B_{m+1}*\B_{m+1}\inv = (\B_m\meet B)*\B_{m+1}\inv
      = \B_m*(B\lc\B_{m+1}\inv).
\]
Since $B\lc\B_{m+1}\inv$ has the same grade as $\B_m\inv = A_m$,
  they must in fact be equal.
So $A_m = B\lc\B_{m+1}\inv$,
  and since $B\inv \subseteq \B_{m+1}\inv$
  making use of the [Lemma](#lemma: similar inverse) that follows,
  we finally conclude that
\[
    A_{m+1} = B\inv\meet A_m = B\inv\meet(B\lc\B_{m+1}\inv)
      = (B\inv\lc B)\lc\B_{m+1}\inv = \B_{m+1}\inv.
\]

\begin{aside}
  _Proof Hint:_ Expand $a\Meet X\inv X$ for vector $a$.
\end{aside}

\label{lemma: similar inverse}
__Lemma:__ Let $X$ be an invertible multivector.
Then $X \subseteq X\inv$,
  and as a corollary $X$ and $X\inv$ represent the same geometric object.

# References
\bibentry{Roelfs DeKeninck 2021}{1}
M. Roelfs, and S. De Keninck, _Graded symmetry groups: plane and simple_,
[https://arxiv.org/abs/2107.03771v1]() [math-ph], 2021.
