% 3.29 Napisati predikat izbaci3(N, X) koji iz prirodnog broja N izbacuje sve cifre
% manje 3. U slučaju da se prosledi neispravan argument, predikat treba da prekine 
% program.

izbaci3(N, 0) :- N > 0, N < 3, !.
izbaci3(N, N) :- N >= 3, N < 10, !.
izbaci3(N, X) :- N >= 10, N mod 10 >= 3, N1 is N // 10, izbaci3(N1, X1), 
X is X1*10 + N mod 10, !.

izbaci3(N, X) :- N >= 10, N mod 10 < 3, N1 is N // 10, izbaci3(N1, X), !.
izbaci3(N, _) :- N =< 0, writeln("Neispravan argument"), fail.  