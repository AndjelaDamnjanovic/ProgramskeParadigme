proizvodPrvih :: Integer -> Integer 
proizvodPrvih n
    | n == 1 = 1
    | otherwise = n * proizvodPrvih (n - 1)