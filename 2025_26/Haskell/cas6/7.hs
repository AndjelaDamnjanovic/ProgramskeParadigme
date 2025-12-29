sledbenici :: [Int] -> [Int]
sledbenici l = map (+1) (filter (>0) l)

sledbenici' :: [Int] -> [Int]
sledbenici' l = [x + 1 | x <- l , x > 0]