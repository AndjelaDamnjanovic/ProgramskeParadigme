poslednji :: [a] -> a
poslednji l = 
    if length l == 1 then (head l)
    else poslednji (tail l)

poslednji' :: [a] -> a
poslednji' [x] = x
poslednji' (_:xs) = poslednji' xs

poslednji'' :: [a] -> a
poslednji'' l = head (reverse l)

poslednji''' :: [a] -> a
poslednji''' l = l !! (length l - 1)