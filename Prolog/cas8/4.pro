% 3.4 Rekurzivni predikat, primer porodičnog stabla.

% rekurzivni predikati -- porodicno stablo

% činjenice
musko(stevan).
musko(mladen).
musko(milos).
musko(petar).
musko(dejan).

zensko(slavica).
zensko(maja).
zensko(milena).
zensko(milica).
zensko(ana).
zensko(mina).

% relacije

roditelj(slavica, mladen).
roditelj(slavica, milos).
roditelj(slavica, milena).
roditelj(slavica, dejan).
roditelj(milena, milica).
roditelj(milica, ana).
roditelj(milica, maja).
roditelj(ana, petar).

% pravila
majka(X, Y) :- zensko(X), roditelj(X, Y).
otac(X, Y) :- musko(X), roditelj(X, Y).

sestra(X, Y) :- zensko(X), roditelj(Z, Y), roditelj(Z, X), X \== Y. 
brat(X, Y) :- musko(X), roditelj(Z, Y), roditelj(Z, X), X \== Y.

ujak(X, Y) :- brat(X, Z), zensko(Z), roditelj(Z, Y).

% rekurzivni predikati

predak(X, Y) :- roditelj(X, Y).
predak(X, Y) :- predak(X, Z), predak(Z, Y).