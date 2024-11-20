-- 2.42 Definisati funkciju spoji lista1 lista2 koja pravi listu uređenih
-- parova tako što spaja redom elemente prve liste sa elementima druge 
-- liste u parove rezultujuće liste.

spoji :: [a] -> [b] -> [(a,b)]

spoji = zip