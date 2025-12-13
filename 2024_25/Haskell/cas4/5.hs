-- 2.5 Napisati funkciju sumaPrvih n koja računa sumu prvih n 
--prirodnih brojeva (rekurzivno, bez korišćenja formule).

{-
    U Haskell-u, za razliku od ostalih jezika sa kojima smo se do
    sada susretali, ne postoji iterativnost, vec se ona implementira
    preko rekurzije. 

    Postoje 2 nacina za rekurzivno pisanje fja: uslovni i pomocu
    ogradjenih jednacina.

    Uslovni obuhvata if-else konstrukciju pri cemu je else deo obavezan
-}

sumaPrvih :: Int -> Int
sumaPrvih n = if n == 1 then 1 else n + sumaPrvih (n - 1)
    
{-
   Sa druge strane, postoje i ogradjene jednacine. Ogradjene jednacine
   su oblika 

   ime_fje arg1 arg2 ... argn 
        | uslov1 = rezultat1
        | uslov2 = rezultat2
        ...
        | uslovn = rezultatn
        | otherwise = rezultat_inace
    
    Pogodniji je za vise uslova i citljiviji je od uslovnog zapisa
-}

sumaPrvih' :: Int -> Int
sumaPrvih' n 
    | n == 1 = 1
    | otherwise =  n + sumaPrvih' (n - 1)

-- Napomena: izraz n - 1 je u zagradi jer bi se inace fja primenila
-- samo na ono direktno iza nje, tj. n, pa bi od dobijenog rezultata 
-- bilo oduzeto 1