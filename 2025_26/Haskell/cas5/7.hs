tipJednacine :: Int -> Int -> Int -> String
tipJednacine a b c 
    | a == 0 = "Degenerisana"
    | b * b - 4 * a * c > 0 = "Dva resenja"
    | b * b - 4 * a * c == 0 = "Jedno resenje"
    | otherwise = "Nema resenja"