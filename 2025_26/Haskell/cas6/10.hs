import Data.List 
sortiraj1 :: [(Int, Int)] -> [(Int, Int)]
sortiraj1 l = sort l

sortiraj2 :: [(Int, Int)] -> [(Int, Int)]
sortiraj2 l = (reverse.sort) l

sortiraj3 :: [(Int, Int)] -> [(Int, Int)]
sortiraj3 l = sortBy uporedi l 

uporedi a b
    | (snd a) < (snd b) = LT
    | (snd a) > (snd b) = GT 
    | otherwise = EQ

sortiraj4 :: [(Int, Int)] -> [(Int, Int)]
sortiraj4 l = sortBy uporedi2 l

uporedi2 a b
    | (snd a) > (snd b) = LT
    | (snd a) < (snd b) = GT 
    | otherwise = EQ

