-- 2.24 Napisati funkciju koja računa dužinu proizvoljne liste bez 
--i sa korišćenjem šablona liste

-- bez korišćenja šablona
{-
    Ukoliko unapred znamo kog su tipa elementi liste, onda u okviru
    deklaracije funkcije navodimo konkretan tip. Sa druge strane, 
    ako funkcija treba da radi za vise tipova, onda u okviru deklaracije
    funkcije navodimo tipski parametar - a (ona oznacava da se bilo 
    koji tip moze naci na njegovom mestu, a konkretan tip ce biti 
    odredjen u fazi interpretacije/kompilacije)
-}
duzina :: [a] -> Int
duzina lst 
    | null lst = 0
    | otherwise = 1 + duzina (tail lst)

-- uz pomoć šablona (najpre navodimo bazni slucaj ako postoji)
duzina' :: [a] -> Int
duzina' [] = 0
duzina' (_:xs) = 1 + duzina' xs
-- posto glava liste ne figurise u daljoj definiciji, moze se zameniti 
-- dzokerom



-- za vezbu se moze pokusati da se isti zadatak uradi uz pomoc uslovnih
-- izraza