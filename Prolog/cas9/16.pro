% 3.16 Napisati predikat maxEl(L, X) koji određuje maksimalni element liste L.

maxEl([G], G) :- number(G), !.
maxEl([G|R], G) :- number(G), maxEl(R, R1), R1 =< G, !.
maxEl([G|R], R1) :- number(G), maxEl(R, R1).