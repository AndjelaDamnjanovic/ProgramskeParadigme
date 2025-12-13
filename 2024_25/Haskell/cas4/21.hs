--2.21 Napisati funkciju parni n koja pravi listu prvih n parnih 
-- prirodnih brojeva. Pretpostaviti da je argument ispravan

parni :: Int -> [Int]
parni' :: Int -> Int -> [Int]

parni n = reverse (parni' 0 n)

parni' k n
    | n <= k = []
    | otherwise = parni' (k + 1) n ++ [2* (k+1)]