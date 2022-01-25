# Miscellaneous Things

* [Book/long article I want to write](/assets/files/notes/plane-geometry.pdf)
    about 2D plane-based geometric algebra $P(\R^*_{3,0,1})$
    built from a ground-up/first principles sort of approach.
    Barely started, but I think you can sort of understand the concept.

* [Notes and Exercises on _Nonstandard Analysis: Theory and Applications_](/assets/files/notes/Arkeryd_Cutland_Henson.1997.pdf)
    by Arkeryd, Cutland, and Henson.
  This book develops Robinsonian nonstandard analysis,
    i.e. constructing "nonstandard extensions" of sets
    using non-principal ultrafilters.
  It starts with the simplest case of first-order extensions
    (which share all first-order properties with the set being extended),
    moves on to extensions of superstructures
    (= a tower of powersets of some base set),
    develops basic real analysis in a nonstandard framework,
    and then goes on to more particular subjects.
  In my notes, you'll find pretty much every exercise completed
    up to but not completing the chapter on nonstandard topology.

  The proposition I've written part III section 1
    has an incomplete, incorrect proof
    and may not be true.

* [Notes on a 2010 paper by Karl Hrbacek](/assets/files/notes/Hrbacek.2010.pdf).
  The original paper presents the axiomatic system GRIST
    for internal axiomatic nonstandard analysis,
  then goes on to prove various theorems about this system,
    show it's application in basic topology and measure theory,
    and cobble together a system that has external sets as well.
  My notes are only concerned with the first section,
    wherein I attempt to build intuition for the axioms of GRIST
    with the ultimate goal of wanting to be able to use these ideas
    in informal mathematical reasoning.
  The most interesting part as the notes stand
    is the section on Standardization,
    where I seem to have been able to prove an equivalent
    but more easily interpretable form of the axiom.

* [Notes on Alex Barrios' lectures](/assets/files/notes/Barrios.AWS.2021.pdf)
    for the [Arizona Winter School 2021](https://www.math.arizona.edu/~swc/aws/2021/index.html).
  My notes are primarily interesting
    because of a brief exposition on the umbral calculus,
    which is then used to derive a well-known recursion formula
    for the Bernoulli numbers;
    and because of an exposition on the classification of the Gaussian primes.

* [Notes on ideas related to "native differentiation"](/assets/files/notes/native-differentiation.pdf).
  The general question is:
    given an algebra,
    under what conditions and to what extent can differentation
    be represented within the algebra?

  For example, in the complex numbers $\C,$
    consider a function $f : D \to \C$ with $D \subseteq C$;
    we can think of $\C$ as a 2D $\R$-vector space,
    in which case $f$ has a Frechet derivative (the total derivative),
    and when the Cauchy-Riemann equations are satisfied
    then this Frechet derivative at a point $a$
    is exactly the map $z \mapsto f'(a)z,$
    where $f'$ is the usual complex derivative of $f.$

  In the case of a geometric algebra,
    we can form a coordinate-independent gradient operator
    which acts through the algebra multiplication.
