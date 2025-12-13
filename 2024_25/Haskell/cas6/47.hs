-- 2.47 Definisati funkciju absSume lista_listi koja na osnovu liste listi
-- celih brojeva pravi listu apsolutnih suma elemenata liste listi 
--korišćenjem kompozicije funkcija za rad sa listama.

absSume :: [[Int]] -> [Int]
-- [[1,2,3], [4, -5], [3,4,5]] => [6, 1, 12]
absSume ll = map (abs.sum) ll

--drugi nacin
-- absSume ll = map abs (map sum ll)