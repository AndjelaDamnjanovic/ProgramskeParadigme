-- 2.8 Napisati funkciju proizvodPrvih n koja računa proizvod prvih n
-- prirodnih brojeva (rekurzivno, bez korišćenja formule).
--  Pretpostaviti da je argument ispravan.

proizvodPrvih :: Int -> Int
proizvodPrvih n = if n == 1 then 1
             else n * proizvodPrvih (n - 1)

-- Alternativno, mozemo napraviti listu prvih n brojeva i iskoristiti
-- ugradjenu fju product nad njom

proizvodPrvih' :: Int -> Int
proizvodPrvih' n = product [1..n]