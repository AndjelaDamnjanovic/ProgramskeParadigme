% 3.3 Aritmetički operatori. Operatori is i cut.

% operatori
/*
is   aritmeticko izracunavanje 
aritmeticki: +, -, *, / (realno deljenje), //, div, mod (celobrojno deljenje), **
relacijski: >, <, >=, =<, =:= (sinonim za == u ostalim programskim jezicima), =\=
! - cut operator, prekida dalju pretragu kad se do njega dođe
*/

/*
Ako je X promenljiva, tada se njoj dodeljuje vrednost koju ima term Y 
(mora biti poznata vrednost), a ukoliko X nije promenljiva, X is Y se svodi na X =:= Y
*/
op1(X, Y):- X is Y.
/*
Termovima X i Y moraju biti poznate vrednosti, inace ce prijaviti gresku.
*/
op2(X, Y):- X =:= Y.

/*
| ?- op1(3,4)
no
| ?- op1(4,4)
yes
| ?- op1(X,4)
X = 4
yes
| ?- op1(4,X)
*** error
| ?- op2(4,4)
yes
| ?- op2(4,2)
no
| ?- op2(4,X)
*** error
| ?- op2(X,4)
*** error
*/

% izračunavanje apsolutne vrednosti
% X >= 0 -> X, X < 0 -> -X
abs(X, X) :- X >= 0, !.
abs(X, Y) :- X < 0, Y is -X.