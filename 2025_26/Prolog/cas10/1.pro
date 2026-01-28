/*

1. promenljive i domeni
X in [1,2,3,4,5]
X :: [1,2,3,4,5]

Y in 1..2..100
Y :: 1..100

2. ogranicenja - relacijski operatori (>, <, =<, >=, =, \=)

alldifferent(L), L = lista promenljivih 
alldistinct(L) 

atleast(N, L, V) 
atmost(N, L, V)
exact(N, L, V)

3. incijalizacija promenljivih
labeling(L)

labeling([minimize(E1)], L) # E1 = X + 2Y + 3Z
labeling([maximize(E2)], L) # E2 = XY -Z 
labeling([minimize(E1), maximize(E2)], L)
*/

petocifren:- Vars = [A, B, C, D, E],
    A in 1..9,
    [B, C, D, E] in 0..9,
    alldifferent(Vars),
    labeling([minimize(A + 2 * B - 3 * C + 4 * D - 5 * E)], Vars),
    Broj is 10000*A + 1000 * B + 100 * C + 10 * D + E,
    write(Broj), nl.