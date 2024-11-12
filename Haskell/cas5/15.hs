-- 2.15 Napisati funkciju delioci n koja pravi listu svih pravih delilaca 
--pozitivnog broja n. Pretpostaviti da je argument ispravan


-- ovaj zadatak sada mozemo uraditi i na laksi nacin koriscenjem list
-- geenratora

delioci :: Int -> [Int]
delioci n = [x | x <- [2.. (div n 2)], mod n x == 0]

-- koriscenjem dobijene liste delilaca lako se moze ustanoviti i da li je 
-- uneti broj prost - samo je potrebno proveriti duzinu liste delioci. Ako
-- je prazna broj je prost, inace nije

prost :: Int -> Bool 
prost n = length (delioci n) == 0