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