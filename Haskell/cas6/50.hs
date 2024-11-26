-- 2.50 Definisati funkcije za sortiranje liste parova brojeva: a) rastuće/opadajuće 
-- po prvom elementu para, b) rastuće/opadajuće po drugom elementu para.

import Data.List 

-- a1) sortiranje elemenata rastuće po prvom elementu

sortiraj :: Ord a => [a] [a]
sortiraj lst = sort lst
-- podsetimo se, ukoliko dve funkcije rade isto, ne moramo pisati listu argumenata
-- pa bi skraćen zapis bio:
-- sortiraj = sort

-- a2) sortiranje opadajuće po prvom elementu

sortiraj2 :: Ord a => [a] -> [a]
-- sortiraj2 lst = sortBy (flip compare) lst
sortiraj2 = sortBy (flip compare) 

--b1) sortiranje po drugom elementu rastuće
poredi :: Ord a => (a,a) -> (a,a) -> Ordering 
poredi a b = compare (snd a) (snd b)
-- alternativno:
-- poredi (p, q) (r, s) = compare q s

sortiraj3 :: Ord a => [(a,a)] -> [(a,a)]
sortiraj3 = sortBy poredi 


-- kako bismo sortirali opadajuce po drugom elementu para 
-- mozemo iskoristiti funkciju sortOn 
-- koja kao argument ocekuje funkciju kljuca koja se 
-- primenjuje nad elementima liste 
-- nakon cega se rezultat primene funkcije koristi pri poredjenju 


-- sortOn je uvedena od verzije 4.8.0.0 (izvor: https://hackage.haskell.org/package/base-4.8.1.0/docs/Data-List.html#v:sortOn)
-- sortiranje raditi pomocu sort i sortBy funkcije ako je starija verzija platforme 
-- ili uraditi upgrade sistema
sortiraj4 :: (Ord a, Num a) => [(a,a)] -> [(a,a)]
sortiraj4 = sortOn (negate . snd)

-- kompozicija negate i snd funkcije
-- transformise parove na sledeci nacin:
-- (a,b) -> -b 
-- ako se iskoristi da: a < b -> -a > -b 
-- funkcija kljuca parove transformise tako 
-- da ce se funkcijom compare sortirati 
-- u obrnutom poretku, tj. opadajuce 