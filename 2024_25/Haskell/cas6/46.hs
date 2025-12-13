-- 2.46 Definisati funkciju sum lista koja računa sumu elemenata 
--celobrojne liste korišćenjem ugrađene funkcije foldr .

suma :: [Int] -> Int
suma lst = foldr (+) 0 lst