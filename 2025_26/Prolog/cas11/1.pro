problem :- Vars = [X, Y, Z],
    X :: 1..90, % X in 1..90
    Y :: 2..2..60,
    Z :: 0..10..100,
    X #>= Z,
    2 * X + X * Y + Z #=< 34,
    labeling(Vars),
    write('X = '), write(X), write(', Y ='), write(Y), write(', Z = '), write(Z), nl,
    fail.