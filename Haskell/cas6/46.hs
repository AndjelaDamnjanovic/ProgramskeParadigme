-- 2.46 Definisati funkciju sum lista koja računa sumu elemenata 
--celobrojne liste korišćenjem ugrađene funkcije foldr .

{-
foldr:

f [] = vr
f (x:xs) = x op (f xs)

[1,2,3,4] +
f [] = 0
f (x:xs) = x + (f xs)
(1 + (2 + (3 + (4 + 0)))))

foldl:
rez op el1 = rez1
rez1 op el2 = rez2
...
rez(n-1) op eln = rezn

[1,2,3,4] +
((((0+1) +2) +3)+4)
-}

suma :: [Int] -> Int
suma lst = foldr (+) 0 lst