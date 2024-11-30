% 3.2 Unifikacija. Jednakost.

/*
=   unifikabilni
\=  nisu unifikabilni
==  identicno jednaki termovi
\== nisu identicno jednaki termovi

*/

% Dva terma su unifikabilna ukoliko postoji supstitucija koja će, ako je primenimo 
% dovesti do jednakosti 2 terma. Ukoliko su u pitanju dve konstante, vraća se da ako
% su iste, a ne inače. Ukoliko je jedan od termova promenljiva, a drugi term, traži 
% se vrednost promenljive tako da je ona jednaka termu. Ako takva vrednost postoji, 
% vraća se da i konkretna vrednost promenljive, a ako je to nemoguće, vraća se ne.
uni(X, Y) :- X = Y.
/*
| ?- uni(4,5)
no
| ?- uni(4,X)
X = 4
yes
*/

% Jednakost (==) proverava da li su prosleđeni termovi identično jednaki. Ako je prosleđen
% isti tip termova (dve konstante, dve promenljive) proverava se da li se sa obe strane
% jednakosti nalazi identičan izraz. U slučaju kompozitnih termova proverava se najpre
% da li su funkcije iste arnosti, pa da li su jednake i ako jesu dalje se porede termovi
% jedan po jedan, po principu provere jednakosti dva terma. 
jed(X, Y) :- X == Y.

/*
| ?- jed(4,X)
no
| ?- jed(4,5)
no
| ?- jed(4,4)
yes
*/