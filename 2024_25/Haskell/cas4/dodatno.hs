-- Neki primeri za vezbanje 

-- 1. Napisati deklaraciju i definiciju fje koja kao argumente prima
-- duzine strana trougla, a kao rezultat vraca obim.

obimTrougla :: Int -> Int -> Int -> Int
obimTrougla a b c = a + b + c

-- Primer je dat cisto da se shvati kako funkcionise deklarisanje fje

--2. Napisati fju koja kao argument prima listu celih brojeva i 
-- racuna njihov zbir

-- a) koriscenje uslovne konstrukcije
suma :: [Int] -> Int
suma lst = if length (lst) == 1 then (head lst)
           else head lst + suma (tail lst)

-- b) koriscenje ogradjenih jednacina
suma' :: [Int] -> Int
suma' lst 
        | null lst = 0 -- fja null vraca True ako je lista prazna, a 
                       --inace False
        | otherwise = sum lst
-- c) ugradjena fja sum
suma'' :: [Int] -> Int
suma'' lst = sum lst