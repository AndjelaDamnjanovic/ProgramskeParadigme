prestupna(X) :- X mod 400 =:= 0.
prestupna(X) :- X mod 4 =:= 0, X mod 100 =\= 0.

% brDana(mesec, godina, izlaz)
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
brDana(februar, X, 29) :- prestupna(X).
brDana(februar, X, 28) :- not(prestupna(X)).