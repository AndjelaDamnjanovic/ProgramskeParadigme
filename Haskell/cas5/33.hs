--2.33 Napisati funkciju spoji l koja spaja listu listi istog tipa l u 
--jednu listu.

-- navedeni zadatak mozemo resiti rekurzivno (ostavljeno za vezbu) ili 
-- koriscenjem ugradjene funkcije concat (koja radi nad listom listi)

spoji :: [[a]] -> [a]
spoji ll = concat ll

-- Napomena: ukoliko dve funkcije imaju isti potpis, iste argumente i 
-- istu implementaciju, onda se prilikom definisanja funkcije, argumenti
-- ne moraju navoditi

spoji' :: [[a]] -> [a]
spoji' = concat