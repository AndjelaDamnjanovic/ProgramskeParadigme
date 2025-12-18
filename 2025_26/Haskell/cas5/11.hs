parovi :: Int -> Int -> Int -> Int -> [(Int, Int)]
parovi a b c d = 
    [(x, y) | y <- [c..d], x <- [a..b]]