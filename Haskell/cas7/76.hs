-- 2.76 Napisati funckije glava i rep koje bezbedno vraćaju glavu i rep liste koristeći
-- tip Maybe.

-- Maybe je tip koji vraća Nothing (ništa, nepostojeća vrednost) ili Just a (postoji
-- vrednost i to je baš ono što će biti vraćeno)

glava :: [a] -> Maybe a 
glava [] = Nothing
glava (x:_) = Just x

rep :: [a] -> Maybe [a]
rep [] = Nothing
rep (_:xs) = Just xs