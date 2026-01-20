clan(X, [X|_]).
clan(X, [_|R]) :- clan(X, R).

% dete(ime, prezime, godine)

deca(L) :- L = [d(_, _, 2),
                d(_, _, 3),
                d(_, _, 4),
                d(_, _, 5),
                d(_, _, 6)],
            clan(d(lazar, jankovic, _), L),
            clan(d(kata, _, G1), L),
            clan(d(_, ivanovic, G2), L),
            G1 =:= G2 + 1,
            clan(d(nevenka, _, G3), L),
            G2 =:= G3 + 1,
            clan(d(marko, _, G4), L),
            clan(d(_, filipovovic, G5), L),
            G5 =:= G4 + 3,
            clan(d(ognjen, _, G6), L),
            clan(d(_, hadzic, G7), L),
            G6 =:= 2 * G7,
            clan(d(_, grbovic, _), L).



            