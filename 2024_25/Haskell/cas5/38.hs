{-2.38 Petar je u školi dobio zadatak da proveri da li u datoj listi 
parova postoji par oblika (prethodnik, sledbenik) za dati prirodan broj. Definisati sledeće funkcije koje pomažu
Petru u rešavanju pomenutog problema:
a) par n - za dati prirodan broj n vraća par brojeva (prethodnik,sledbenik)-}

par :: Int -> (Int, Int)
par n = (n-1, n+1)

-- b) postojiPar lista_parova - za datu listu parova (a,b) i prirodan broj n proverava da
--li u listi postoji bar jedan par (a,b) takav da je a prethodnik broja n,
-- a b sledbenik broja n

postojiPar :: [(Int, Int)] -> Int -> Bool
postojiPar lst n 
    | null lst = False
    | (head lst) == (par n) = True
    | otherwise = postojiPar (tail lst) n

-- resenje koriscenjem list generatora
postojiPar' :: [(Int, Int)] -> Int -> Bool
postojiPar' lst n = length ([x | x <- lst, x == (par n)]) > 0