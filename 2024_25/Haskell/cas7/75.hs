-- 2.75 Definisati novi rekurzivni tip Lista sa konstruktorima Null i Konstanta i
--napisati funkciju koja računa dužinu instance tipa Lista.

data Lista a = Null | Konstanta a (Lista a) deriving Show

duzina :: Lista a -> Int
duzina (Null) = 0
duzina (Konstanta _ xs) = 1 + duzina xs