--2.17 Napisati funkciju sumaKvadrata n koja računa sumu kvadrata 
--prvih n prirodnih brojeva (rekurzivno, bez korišćenja formule).

sumaKvadrata :: Int -> Int
sumaKvadrata n = if n == 1 then 1
                 else n*n + sumaKvadrata (n-1)

-- Takodje, ukoliko zelimo stepen nekog broja, mozemo to napisati
-- kao x^n, gde je n zeljeni stepen