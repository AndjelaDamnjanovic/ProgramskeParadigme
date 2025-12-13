/*
3.6 Napisati sledeće predikate:
a) maksimum(A, B, M) - određuje maksimum za dva broja A i B
b) suma(N, S) - za dati prirodan broj N računa sumu prvih N brojeva
c) sumaParnih(N, S) - za dati paran prirodan broj N računa sumu parnih brojeva od 2 do N
d) proizvod(N, P) - za dati prirodan broj N računa proizvod prvih N prirodnih brojeva
e) proizvodNeparnih(N, P) - za dati neparan prirodan broj N računa proizvod neparnih brojeva
od 1 do N
f) cifre(N) - ispisuje cifre prirodnog broja N rečima
*/

% a) 
maksimum(A, B, M) :- A >= B, M is A, !.
maksimum(_, B, M) :- M is B.

% drugi način:
% maksimum(A, B, A) :- A >= B, !.
% maksimum(A, B, B).

% b) 
suma(N, S) :- S is N*(N+1)/2.

suma1(1, S) :- S is 1, !.
suma1(N,S) :- N > 1, N1 is N - 1, suma1(N1, S1), S is N + S1. 

% c) sumaParnih(N, S)

sumaParnih(2, 2) :- !.
sumaParnih(N, S) :- N > 2, N1 is N - 2, sumaParnih(N1, S1), S is S1 + N.

% Treba napomenuti da navedeni predikat neće raditi ukoliko se kao argument prosledi
% neparan broj, pa ukoliko bismo želeli da ipak omogućimo izvršavanje i za neparne 
% brojeve (računali bismo sumu svih parnih koji su manji od njga), to bismo mogli
% da uradimo na sledeći način:

sumaP(1, 0) :- !.
sumaP(2, 2) :- !.
sumaP(N, S) :- N mod 2 =:= 1, N1 is N - 1, sumaP(N1, S), !.
sumaP(N, S) :- N > 2, N1 is N - 2, sumaP(N1, S1), S is S1 + N.

% d) proizvod(N, P)

proizvod(1,1) :- !.
proizvod(N, P) :- N > 1, N1 is N - 1, proizvod(N1, P1), P is P1 * N.

% e) proizvodNeparnih(N, P)
% ponovo, imamo dva načina za definisanje predikata: ukoliko ne želimo da radi za 
% parne brojeve, implementacija je sledeća: 

proizvodNeparnih(1, 1) :- !.
proizvodNeparnih(N, P) :- N > 1, N1 is N - 2, proizvodNeparnih(N1, P1), P is N * P1.

% sa druge strane, da bi program radio i za parne brojeve, implementacija je:

proizvodN(1,1) :- !.
proizvodN(N, P) :- N mod 2 =:= 0, N1 is N - 1, proizvodN(N1, P), !.
proizvodN(N, P) :- N > 1, N1 is N - 2, proizvodN(N1, P1), P is P1 * N.

% cifre(N)

cifra(0, nula).
cifra(1, jedan).
cifra(2, dva).
cifra(3, tri).
cifra(4, cetiri).
cifra(5, pet).
cifra(6, sest).
cifra(7, sedam).
cifra(8, osam).
cifra(9, devet).

cifre(N) :- N >= 1, N < 10, cifra(N, C), write(C), nl, !.
cifre(N) :- N > 10, D is N // 10, R is N mod 10, cifre(D), cifra(R, C), write(C), nl.  