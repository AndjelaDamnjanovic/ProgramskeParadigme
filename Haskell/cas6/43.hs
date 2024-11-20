-- 2.43 Definisati funkciju uvecaj lista koja svaki element celobrojne 
--liste uvećava za jedan.

uvecaj :: [Int] -> [Int]

-- map unarna_funkcija lista
uvecaj lst = map (+1) lst