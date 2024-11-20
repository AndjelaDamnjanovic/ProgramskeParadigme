-- 2.48 Definisati funkciju sledbenici l koja vraća listu sledbenika 
--elemenata liste l koji su prirodni brojevi.

sledbenici :: [Int] -> [Int]
-- [1,2,-3,0] 
sledbenici l = map (+1) (filter (>0) l)

-- podsecanje list generatora
sledbenici' l = [x+1| x <- l, x>0]
-- dakle list generator = map + filter