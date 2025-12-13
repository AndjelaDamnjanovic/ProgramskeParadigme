-- 2.28 Napisati funkciju zavisnoY a b koja generiše listu parova 
--celih brojeva (x, y), za koje x pripada segmentu [a, b], a y 
--pripada segmentu [x, b].

zavisnoY :: Int -> Int -> [(Int, Int)]
zavisnoY a b = [(x, y) | x <- [a..b], y<- [x..b]]

-- NAPOMENA: sada NE BISMO smeli da navodimo domene za x i y proizvoljno
-- jer jedno zavisi od drugog. U takvim situacijama se najpre navodi
-- domen nezavisnog elementa, pa tek onda zavisnog

-- kao dokaz nekorektnosti obrnutog redosleda moze se otkomentarisati
-- sledeci kod 
--zavisnoY' :: Int -> Int -> [(Int, Int)]
--zavisnoY' a b = [(x, y) | y <- [x..b], x<- [a..b]]