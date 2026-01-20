% dete(ime, prezime, zivotinja)

clan(X, [X|_]).
clan(X, [_ | R]) :- clan(X, R).

deca(L) :- L = [d(_, _, macka),
                d(_, _, sova),
                d(_, _, pingvin),
                d(_, _, zlatnaribica)
                ],
            clan(d(_, milic, sova), L),
            clan(d(pera, _, X), L),
            X \== macka,
            clan(d(_, jovic, Y), L),
            clan(d(_, lazic, _), L),
            Y \== macka,
            clan(d(mika, Z, pingvin), L),
            Z \== lazic,
            clan(d(zika, _, zlatnaribica), L),
            clan(d(laza, petrovic, _), L).
            

            