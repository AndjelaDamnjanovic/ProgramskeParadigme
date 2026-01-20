% igrac(ime, prezime, rang)

clan(X, [X|_]).
clan(X, [_|R]) :- clan(X, R).

igraci(L) :- L = [
                i(dzad, _, 1),
                i(_, _, 2),
                i(_, _, 3),
                i(_, _, 4),
                i(_, _, 5),
                i(_, _, 6)],
            clan(i(ding, junhui, _), L),
            clan(i(dzon, _, R1), L),
            clan(i(_, vilson, R2), L),
            R1 =:= R2 * 2,
            clan(i(_, tramp, R3), L),
            R2 =:= R3 + 1,
            clan(i(roni, _, R4), L),
            clan(i(_, higins, R5), L),
            R4 =:= R5 + 1,
            clan(i(mark, _, R6), L),
            R5 =:= R6 + 1,
            clan(i(_, osaliven, R7), L),
            clan(i(kajren, _, R8), L),
            R7 =:= R8 + 3,
            clan(i(_, vilijams, _), L).

odgovori(X, Y) :- igraci(L), clan(i(X, osaliven, Y), L).
            