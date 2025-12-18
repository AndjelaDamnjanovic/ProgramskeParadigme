bezbedanRep :: [a] -> [a]
bezbedanRep l =
    if length l == 0 then []
    else tail l

bezbedanRep' :: [a] -> [a]
bezbedanRep' l 
    | length l == 0 = []
    | otherwise = tail l

bezbedanRep'' :: [a] -> [a]
bezbedanRep'' [] = []
bezbedanRep'' (_:xs) = xs