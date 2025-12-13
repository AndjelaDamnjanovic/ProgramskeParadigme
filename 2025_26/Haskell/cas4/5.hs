sumaPrvih :: Int -> Int
sumaPrvih n = 
    if n == 1 then 1
    else sumaPrvih (n - 1) + n