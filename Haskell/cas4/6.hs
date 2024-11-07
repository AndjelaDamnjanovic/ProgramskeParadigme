--2.6 Napisati funkciju lista a b koja pravi listu celih brojeva iz 
--segmenta [a, b]. U slučaju da granice segmenta nisu ispravne, 
--rezultat je prazna lista.

{-
    Liste su osnovni tip podataka u Haskell-u. One se mogu konstruisati
    tako sto se navede lista elemenata unutar uglastih zagrada

    lista = [1, 2, 3, 4, 5]
    Ili tako sto se zadaju pocetna i krajnja  tacka intervala razdvojenih
    sa ..
    lista2 = [1..7]

    Moguce je dodati i korak tako sto se navedu prva dva elemeta i poslednji
    lista3 = [1, 5 .. 12]
-}

{-
    Neke bitne operacije sa listama:
        - konkatenacija (operator ++): lista ++ lista2
        - dodavanje na pocetak (operator :): elem : lista
        - indeksni pristup (operator !!): lista !! pozicija
        - provera da li je element u listi (fja elem): elem 3 [1..5]
        - sabiranje svih elemenata liste: sum lista
        - proizvod svih elemenata liste: product lista
-}

-- pisanje liste u potpisu fje radi se tako sto se unutar uglastih 
-- zagrada navede tip elemenata. Svi elementi liste MORAJU biti istog
-- tipa
lista :: Int -> Int -> [Int]
lista a b = if a < b then [a..b] else []