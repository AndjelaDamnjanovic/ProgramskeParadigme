op1(X, Y) :- X is Y.

uvecaj(X, Y) :- Y is X + 1. 

/*
aritm. operatori: +, -, *, /, //, mod, div 
relacijski oper: <, =<, >, >=
poredjenje: =:=, =\=

= - unifikacija (\=)
== - poredi termove na jednakost (\==)
=:= - proverava aritmeticku jednakost izraza (=\=)

*/

% (-3, Y)
abs1(X, Y) :- X >= 0, Y is X.
abs1(X, Y) :- X < 0, Y is -X.

% X => X, -X
% (3, Y)
abs2(X, X) :- X >= 0, !.
abs2(X, Y) :- X < 0, Y is -X. 