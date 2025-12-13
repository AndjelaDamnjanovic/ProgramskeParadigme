--2.18 Napisati funkciju brojDelilaca n koja vraća broj pravih 
--delilaca prirodnog broja n.

{-
    Posto Haskell ne prepoznaje standardne promenljive (zbog cistoce
    i referencijalne transparentnosti), ovaj zadatak se ne moze resiti
    onako kako bismo ga resili na nekom od imperativnih
    programskih jezika. 

    Ukoliko bismo zeleli da oponasamo brojac, mozemo to uraditi tako
    sto cemo definisati drugu funkciju koja ce ga imati kao argument i
    uvecavati ga prilikom svakog koraka rekurzije
-}

brojDelilaca :: Int -> Int
brojDelilaca' :: Int -> Int -> Int


brojDelilaca n = brojDelilaca' n 2
brojDelilaca' n k
    | n == k = 0
    | n `mod` k == 0 = brojDelilaca' n (k + 1) + 1
    | otherwise = brojDelilaca' n (k + 1)
-- Napomena: novu funkciju nismo morali da pisemo odvojeno sa svojim 
-- potpisom, vec smo mogli napisati kod na sledeci nacin:

brojDelilaca1 :: Int -> Int 
brojDelilaca1 n = brojDelilaca1' n 2
    where brojDelilaca1' n k
            | n == k = 0
            | n `mod` k == 0 = brojDelilaca1' n (k + 1) + 1
            | otherwise = brojDelilaca1' n (k + 1)

-- Medjutim, ovo predstavlja eksplicitno pravljenje stanja, te se 
-- stoga ne preporucuje