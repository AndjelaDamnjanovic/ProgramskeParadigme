% 3.17 Napisati predikate za sortiranje liste rastuće:

% a) insertionSort(L, SL) - insertion sort algoritam se zasniva na ubacivanju redom svakog
% elementa liste na svoje pravo mesto (mesto u sortiranoj listi)

/*
    Insertion sort:
        Indukcijska hipoteza: znamo da sortiramo listu duzine N - 1
        Indukcijski korak: dodaj N-ti element na svoje mesto
*/

insertionSort([], []) :- !.
insertionSort([G|R], NL) :- insertionSort(R, NL1), dodajG(G, NL1, NL).

dodajG(G, [], [G]) :- !.
dodajG(G, [X|R], [G, X|R]) :- G =< X, !.
dodajG(G, [X|R], [X|R1]) :- dodajG(G, R, R1).

% b) mergeSort(L, SL) - merge sort algoritam se zasniva na dekompoziciji liste, tj. listu delimo
% na dva jednaka dela, te delove sortiramo i posle toga ih objedinjujemo

/*
    Merge sort:
        Indukcijska hipoteza: znamo da sortiramo listu dimenzija n/2
        Indukcijski korak: objedinjavanje dve liste od po n/2 elemenata
*/

mergeSort([], []) :- !.
mergeSort([X], [X]) :- !. % posto se deljenjem liste na dva dela moze desiti da neka
                        % od novodobijenih listi ima neparan broj elemenata to znaci
                        % da ce se daljom rekurzijom desiti da bar neka od listi ima samo 
                        % jedan element, pa da ne bismo ulazili dublje u rekurziju potrebno
                        % je definisati i bazni slucaj koji obuhvata jednoclane liste
mergeSort(N, SL) :- podeli(N, L, R), mergeSort(L, SL1), mergeSort(R, SR1), 
        objedini(SL1, SR1, SL).

% posto u Prologu ne postoji indeksni pristup, dosta je nezgodno podeliti listu 
% tako sto prvih n/2 elemenata ide u prvu listu, a ostatak u drugu, te se moramo nekako
%dovijati za resenje. Posto sablon liste nudi opciju da se prva dva elementa liste 
% odvoje od repa, mozemo upravo njega iskoristiti i svaki prvi element staviti u prvu
% listu, a svaki drugi u drugu. Primetimo da ovo nece praviti problem prilikom sortiranja
% jer nije potrebno da liste budu sortirane.

podeli([], [], []) :- !.
podeli([X], [X], []) :- !.
podeli([X1, X2| R], [X1|R1], [X2|R2]) :- podeli(R, R1, R2).

objedini(L, [], L) :- !.
objedini([], L, L) :- !.
objedini([G1|R1], [G2|R2], [G1|R]) :- G1 < G2, objedini(R1, [G2|R2], R), !.
objedini(L1, [G2|R2], [G2|R]) :- objedini(L1, R2, R).