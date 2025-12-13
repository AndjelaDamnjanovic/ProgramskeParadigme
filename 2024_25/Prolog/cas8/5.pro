% 3.5 Napisati Prolog predikate:
% • prestupna koji određuje da li je godina prestupna
% • brDana koji određuje koliko dana ima prosleđeni mesec

% deljiva sa 4, ali ne i sa 100, ili deljiva sa 400
prestupna(X) :- X mod 400 =:= 0, !.
prestupna(X) :- X mod 4 =:= 0, X mod 100 =\= 0.

%brDana(mesec, godina, X)
% anonimna promenljiva _ se koristi da oznaci da nam vrednost koja se prosledi za 
% godinu nije bitna, moze biti bilo sta, ali tu vrednost ne koristimo

brDana(januar, _, 31).
brDana(mart, _, 31).
brDana(april, _, 30).
brDana(maj, _, 31).
brDana(jun, _, 30).
brDana(jul, _, 31).
brDana(avgust, _, 31).
brDana(septembar, _, 30).
brDana(oktobar, _, 31).
brDana(novembar, _, 30).
brDana(decembar, _, 31).

brDana(februar, G, 29) :- prestupna(G), !.
brDana(februar, _, 28).