/*
    Liste u Prologu
    
    Liste u Prologu su kolekcije termova. To znači da elementi liste mogu biti isti
    tipovi terma, ali i ne moraju. Dakle, moguće je definisati listu koja sadrži samo brojeve, npr. [1,2,3,4,5] (analogno važi i za atome, promenljive i kompozitne termove) ili recimo listu brojeva i atoma: [1,2,3,a,c,5] (analogno važi i za proizvoljna dva tipa termova koji su različiti).

    [] - šablon prazne Liste
    [X] - šablon jednočlane liste
    [X, Y] - šablon dvočlane liste
    . - konstruktor Liste
    . (g, r) - konstrukcija liste koja se sastoji od glave i repa
    . (1, .(2, (3, []))) - rekurzivna konstrukcija liste od više elemenata
    [1,2,3] - kraći zapis gore definisane liste (dostupan u Prologu zbog čitljivosti)
    [G|R] - šablon neparne liste
    [G1, G2|R] - šablon neprazne liste koja ima barem dva elementa 
    [G1, G2, G3|R] - ovaj šablon može ići i do dubine 3, ali i proizvoljno duboko u listu
    [X, Y] [1, 2] -- ukoliko pokušamo da unifikujemo date liste, dobijamo X = 1, Y = 2
    [X, Y, Z] [1,2] -- unifikacijom navedenih listi dobijamo X = 1, Y = 2, Z = []
    [X, Y|Z] [a, b, c] -- unifikacijom dobijamo X = a, Y = b, Z = [c], Z nije c jer je rep liste lista
*/

% neki predikati za rad sa listama

% sadrzi(X, L) - proverava da li se element X sadrži u listi L.

sadrzi(_, []) :- fail, !.
sadrzi(X, [X|_]) :- !. % ukoliko se element X poklapa sa glavom liste, onda se 
                        % poklapa sa ovim sablonom
sadrzi(X, [_|R]) :- sadrzi(X, R). % ako se X i glava liste ne poklapaju, onda se 
                                 % dolazi do ovde

/* neki test primeri i njihovi rezultati:

| ?- sadrzi(1, [1,2,3,4,5]).

yes
| ?- sadrzi(1, [2,3,4,5]).  
no
| ?- sadrzi(1, [2,3,4,5, a]).
no
| ?- sadrzi(a, [2,3,4,5, a]).

*/

% duzina(L, D) - vraća dužinu liste

duzina([], 0) :- !.
duzina([_|R], D) :- duzina(R, D1), D is D1 + 1.

/* Test primeri:

| ?- duzina([1,2,3,4,5], S).
S = 5
yes
| ?- duzina([1,2,3,4,5, a], S).
S = 6
yes
| ?- duzina([1,2,3,4,5, a, [1,2,3]], S).
S = 7
yes
| ?- duzina([], S).                     
S = 0
yes

*/

% suma(L, S) - za dobijenu listu daje sumu elemenata liste

suma([], 0) :- !.
suma([G|R], S) :- number(G), suma(R, S1), S is S1 + G. % number(G) daje odgovor 
                                                        % "da" ako je prosledjena
                                                        % vrednost broj, jer mozemo
                                                        % da sabiramo samo brojeve
% arsr(L, A) -- za dobijenu listu vraca njenu aritmeticku sredinu

arsr([], 0) :- !.
arsr(L, A) :- duzina(L, D), suma(L, S), A is S/D. % ovde ne moramo proveravati da li
                                                % je element liste broj jer to vec radi
                                                % predikat suma koji se poziva

/*
Test primeri:
| ?- arsr([], A).
A = 0
yes
| ?- arsr([1,2,3,4,5], A).
A = 3.0
yes
| ?- arsr([2,2,2,2], A).  
A = 2.0
yes
*/