-- 2.3 Napisati funkciju ostatak3 n koja računa ostatak pri deljenju broja n sa 3

{-   najpre pisemo potpis funkcije - treba da dobijemo ceo broj i da 
    vratimo ceo broj
    Takodje, posto je mod takodje funkcija u Haskell-u, i ona podleze
    pravilima za pisanje funkcija - prvo ide ime, pa argumenti
 -}

ostatak3 :: Int -> Int

ostatak3 n = mod n 3

{-
    Ukoliko bismo bas zeleli standardan infiksni zapis, mogli bismo
    i njega da koristimo, ali onda se on stavlja pod kose navodnike 
    (``) koji se nalaze pre 1 na tastaturi
-}

ostatak3' :: Int -> Int
ostatak3' n = n `mod` 3