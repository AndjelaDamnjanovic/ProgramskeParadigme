% k(boja, nacionalnost, jelo, pice, ljubimac)

clan(X, [X|_]).
clan(X, [_| R]) :- clan(X, R).

desno(X, Y, [Y, X | _]).
desno(X, Y, [_| R]) :- desno(X, Y, R).

pored(X, Y, L) :- desno(X, Y, L) ; desno(Y, X, L).

kuce(L) :- L = [k(_, norvezanin, _, _, _),
                k(plava, _, _, _, _),
                k(_, _, _, mleko, _),
                k(_, _, _, _, _),
                k(_, _, _, _, _)],
            clan(k(crvena, englez, _, _, _), L),
            clan(k(_, spanac, _, _, pas), L),
            clan(k(zelena, _, _, kafa, _), L),
            clan(k(_, ukrajinac, _, caj, _), L),
            desno(k(zelena, _, _, _, _), k(bela, _, _, _, _), L),
            clan(k(_, _, spagete, _, puz), L),
            clan(k(zuta, _, pica, _, _), L),
            pored(k(_, _, piletina, _, _), k(_, _, _, _, lisica), L),
            pored(k(_, _, pica, _, _), k(_, _, _, _, konj), L),
            clan(k(_, _, brokoli, narandza, _), L),
            clan(k(_, japanac, susi,_, _ ), L),
            clan(k(_, _, _, voda, _), L),
            clan(k(_, _, _, _, zebra), L).

odgovor(X, Y) :- kuce(L), clan(k(_, X, _, _, zebra), L), clan(k(_, Y, _, voda, _), L).



