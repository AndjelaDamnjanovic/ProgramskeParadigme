-- 2.52 Definisati funkciju reverse' l za obrtanje liste l pomoću funkcije
-- foldl.

reverse' :: [a] -> [a]
{-
    [] = []
    1 : [] = [1]
    2 : [1] = [2,1]

    foldl:
rez op el1 = rez1
rez1 op el2 = rez2
...
rez(n-1) op eln = rezn

-}
reverse' l = foldl (flip (:)) [] l