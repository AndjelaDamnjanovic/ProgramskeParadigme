musko(pera).
musko(zika).
musko(mika).
musko(aca).
musko(laza).
musko(janko).

zensko(milena).
zensko(marija).
zensko(milica).
zensko(lena).
zensko(slavica).

roditelj(pera, zika).
roditelj(pera, mika).
roditelj(milena, zika).
roditelj(zika, marija).
roditelj(zika, aca).
roditelj(zika, laza).
roditelj(slavica, lena).
roditelj(janko, pera).
roditelj(janko, milena).

majka(X, Y) :- zensko(X), roditelj(X, Y).
otac(X, Y) :- musko(X), roditelj(X, Y).
sestra(X, Y) :- zensko(X), roditelj(Z, X), roditelj(Z, Y), X \== Y.
brat(X, Y) :- musko(X), roditelj(Z, X), roditelj(Z, Y), X \== Y.

predak(X, Y) :- roditelj(X, Y).
predak(X, Y) :- roditelj(X, Z), predak(Z, Y). 
