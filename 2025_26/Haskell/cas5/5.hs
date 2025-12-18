prost :: Int -> Bool 
prost n = prostPom n 2

prostPom n d 
    | n == d = True
    | n `mod` d == 0 = False
    | otherwise = prostPom n (d + 1)