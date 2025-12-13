rastavi :: [(a, b)] -> ([a], [b])
rastavi = unzip

qsort [] = []
qsort (x:xs) = (qsort manji) ++ [x] ++ (qsort veci)
    where manji = [e | e <-xs, e < x]
          veci = [e | e <-xs, e > x]