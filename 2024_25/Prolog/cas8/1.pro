% U bazu znanja uneti informacije o životinjama i njihovim odnosima po pitanju
% veličine. Napisati pravilo koje omogućava da se proveri koja je od dve životinje veća, 
% kao i da generiše sve životinje za koje je neka životinja veća.


% jednolinijski komentar

/*
    viselinijski komentar

    Term: 
        - konstante: atomi (stringovi koji pocinju malim slovom) i brojevi (celi, realni)
        - promenljive: stringovi koji velikim slovom ili _
        - kompozitni termovi: f(t1, t2, ..., tn), gde je f fja (arnosti n), a ti su termovi
    
    Hornove klauze:
        - cinjenice (izrazavaju svojstva, relacija izmedju termova): covek(milan).
        - pravilo: H(glava pravila) :- B1, B2, ..., Bn. 
        - upit (u terminalu)
    Baza znanja
*/

% cinjenice
zivotinja(slon).
zivotinja(pas).
zivotinja(macka).
zivotinja(mis).
zivotinja(zebra).

veci(slon, pas).
veci(pas, macka).
veci(macka, mis).
veci(slon, zebra).
veci(zebra, pas).

% uvodimo pravilo kako bismo dodali tranzitivnost relacije
jeVeci(X, Y) :- veci(X, Z), veci(Z, Y).

% neki od mogućih upita koje je moguće pitati iz terminala:
% zivotinja(slon). -- pitamo da li je slon životinja. Dobijamo odgovor yes
% zivotinja(sova). -- pitamo da li je sova životinja. Dobijamo odgovor no, jer se 
                    % podatak da je sova životinja ne nalazi u našoj bazi znanja.
% veci(slon, zebra). -- pitamo da li je slon veći od zebre. Dobijamo odgovor yes
% veci(slon, macka). -- pitamo da li je slon veći od mačke. Dobijamo odgovor no, jer se 
                    % podatak ne nalazi u našoj bazi znanja. 
% jeVeci(slon, macka). -- pitamo da li je slon veći od mačke. Dobijamo odgovor yes
% veci(slon, X). -- pitamo interpreter da nam pronađe sve životinje od kojih je slon veći.
                    % Dobijamo odgovore: X = pas i X = zebra jer se ti podaci nalaze u 
                    % našoj bazi znanja.
% veci(X, macka). -- pitamo interpreter da nam pronađe sve životinje koje su veće od mačke
                    % Dobijamo odgovor: X = pas jer se taj podatak nalazi u 
                    % našoj bazi znanja.
% veci(X, Y). -- pitamo interpreter da nam pronađe sve parove životinja tako da je X
                % veća od Y.
