-- 2.29 Napisati funkciju bezbedanRep l koja ukoliko je lista l prazna
-- vraća praznu listu, inače vraća rep liste l, koristeći: 
--a) uslovne izraze b) ograđene jednačine c) uparivanje šablona

-- a) uslovni izrazi
bezbedanRep :: [a] -> [a]
bezbedanRep lst = if (null lst) then [] else (tail lst)

-- b) ogradjene jednacine
bezbedanRep1 :: [a] -> [a]
bezbedanRep1 lst
    | null lst = []
    | otherwise = tail lst
    
-- c) sabloni 
bezbedanRep2 :: [a] -> [a]
bezbedanRep2 [] = []
bezbedanRep2 (_ : xs) = xs