% 3.11 Napisati sledeće predikate:
% a) dodajPocetak(X, L, NL) - dodaje X na početak liste L

dodajPocetak(X, L, [X|L]).

% b) dodajKraj(X, L, NL) - dodaje X na kraj liste L

dodajKraj(X, [], [X]) :- !.
dodajKraj(X, [G|R], [G|R1]) :- dodajKraj(X, R, R1).

% c) obrisiPrvi(L, NL) - briše prvi element, tj. glavu liste

obrisiPrvi([_|R], R).

% d) obrisiPoslednji(L, NL) - briše poslednji element liste

obrisiPoslednji([_], []) :- !.
obrisiPoslednji([G|R], [G|R1]) :- obrisiPoslednji(R, R1).

% e) obrisi(X, L, NL) - briše sva pojavljivanja elementa X u listi L

obrisi(_, [], []) :- !.
obrisi(X, [X|R], R1) :- obrisi(X, R, R1), !.
obrisi(X, [Y|R], [Y|R1]) :- obrisi(X, R, R1).

% f) obrisiPrvo(X, L, NL) - briše samo prvo pojavljivanje elementa X u listi L

obrisiPrvo(_, [], []) :- !.
obrisiPrvo(X, [X|R], R) :- !.
obrisiPrvo(X, [Y|R], [Y|R1]) :- obrisiPrvo(X, R, R1).

% g) obrisiK(L, K, NL) - briše K-ti element liste L

obrisiK([], _, []) :- !.
obrisiK([_|R], 0, R) :- !.
obrisiK([G|R], K, [G|R1]) :- K > 0, K1 is K - 1, obrisiK(R, K1, R1).