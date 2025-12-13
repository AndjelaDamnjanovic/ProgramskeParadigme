--2.32 Napisati funkciju poslednji l koja određuje poslednji element 
--proizvoljne neprazne liste l.
poslednji :: [a] -> a
poslednji [x] = x
poslednji (_:xs) = poslednji xs

-- jos neki nacini da se resi ovaj zadatak:
-- poslednji lst = if length lst == 1 then head lst else poslednji (tail lst)

--poslednji lst
--    | length lst == 1 = head lst
--    | otherwise = poslednji (tail lst)

-- poslednji lst = head (reverse lst)

-- poslednji lst = last lst

--poslednji lst = lst !! (length lst - 1)
