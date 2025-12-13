% 3.15 Napisati predikat pretvori(L, X) koji za datu listu cifara L formira broj
% određen tim ciframa.

pretvori([], 0) :- !.
pretvori(L, X) :- izdvoj(L, Poslednji, Ostatak), pretvori(Ostatak, Y), X is Y * 10 + Poslednji.

izdvoj([G], G, []) :- !.
izdvoj([G|R], X, [G|R1]) :- izdvoj(R, X, R1).