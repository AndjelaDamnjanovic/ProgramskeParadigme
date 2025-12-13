{- 2.37 Ana uči prirodne brojeve i zanima je na koje sve načine može da 
razloži dati broj u obliku proizvoda dva prirodna broja, kao i koliko takvih razlaganja ima. Definisati sledeće
funkcije koje pomažu Ani u rešavanju pomenutog problema:

a) razlozi n - za dati prirodan broj n vraća listu parova (a,b) takvih da su a i b prirodni
brojevi iz intervala [1,n] i da je proizvod a i b jednak n -}

razlozi :: Int -> [(Int, Int)]
razlozi n = [(x, y) | x<- [1..n], y<- [1..n], x*y ==n]

-- b) brojP n - računa na koliko se različitih načina dati prirodan broj n
-- može predstaviti u obliku proizvoda dva prirodna broja

brojP :: Int -> Int
brojP n = length (razlozi n)