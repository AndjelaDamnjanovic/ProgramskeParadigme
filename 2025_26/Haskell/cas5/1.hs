sumaPrvih :: Int -> Int 
sumaPrvih n =
    if n < 0 = -1
    else if n == 0 then 0
    else sumaPrvih (n - 1) + n

sumaPrvih' :: Int -> Int 
sumaPrvih' n 
    | n < 0 = -1
    | n == 0 = 0
    | otherwise = n + sumaPrvih' (n - 1)