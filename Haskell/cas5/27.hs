--2.27 Napisati funkciju parovi a b c d koja generiše listu parova celih
-- brojeva (x, y), za koje x pripada segmentu [a, b], a y pripada 
--segmentu [c, d].


-- kada element liste sadrzi vise vrednosti, potrebno je za svaku
-- navesti domen


parovi :: Int -> Int -> Int -> Int -> [(Int, Int)]
parovi a b c d = [(x, y) | x <- [a..b], y<- [c..d]]

--NAPOMENA: da smo obrnuli redosled definicija domena za x i y 
-- funkcija bi i dalje radila kako treba, ali bi prvo fiksirala
-- vrednost y, pa onda prosla kroz vrednosti za x. Dakle, dobija se
-- isti skup parova, ali ne i isti redosled

parovi' :: Int -> Int -> Int -> Int -> [(Int, Int)]
parovi' a b c d = [(x, y) | y <- [c..d], x<- [a..b]]