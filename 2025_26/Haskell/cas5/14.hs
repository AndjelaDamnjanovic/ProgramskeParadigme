savrseni :: Int -> [Int]
savrseni n = [x | x <- [1..(n-1)], sum(delioci x 1) == x] 

delioci n d =
    if n == d then []
    else if (mod n d) == 0 then [d] ++ (delioci n (d + 1))
    else delioci n (d + 1)
