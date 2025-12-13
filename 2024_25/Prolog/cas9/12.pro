% 3.12 Napisati predikat podeli(L, L1, L2) koji deli listu L na dve liste, listu
% pozitivnih elemenata L1 i listu negativnih elemenata L2

podeli([], [], []) :- !.
podeli([G|R], [G|R1], R2) :- G >= 0, podeli(R, R1, R2), !.
podeli([G|R], R1, [G|R2]) :- podeli(R, R1, R2).