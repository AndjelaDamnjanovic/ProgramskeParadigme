-- 2.49 Definisati rekurzivnu funkciju list_elem x l koja proverava da li
-- lista l sadrži dati element x. Dodatno, definisati prethodnu funkciju 
-- korišćenjem funkcija or i map.

list_elem x l
 | null l = False
 | (head l) == x = True
 | otherwise = list_elem x (tail l)

list_elem' x l = (or.map (== x)) l

list_elem'' x l = any (== x) l