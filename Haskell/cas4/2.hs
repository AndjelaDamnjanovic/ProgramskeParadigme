-- 2.2 Napisati funkciju duplo n koja računa dvostruku vrednost 
-- celog broja n.

{-  Posto ovaj fajl nema main funkciju, mora se interpretirati
    Ukoliko bi kompajliranje bilo pokusano, kompajler bi se bunio jer 
    ne postoji main funkcija od koje bi krenuo izvrsavanje. Sledeci
    kod ce moci da se izvrsi i za Int i za Double tip podataka jer 
    interpreter automatski zakljucuje najsiri tipski razred.
-}

duplo n = 2*n

{-
    Medjutim, posto zadatak kaze da se racuna dupla vrednost celog 
    broja, samim tim i rezultat mora biti ceo broj, pa ne zelimo da
    postoji mogucnost da se nasa funkcija izvrsi nad Double tipom. Da 
    bismo to sprecili, pisemo rucno deklaraciju funkcije. Deklaracija
    se pise tako sto se navede u obliku
    
    ime_funkcije :: tip_arg1 -> ... -> tip_argn -> tip_povratne_vr
    Dakle, ukoliko imamo funkciju sa nazivom duplo' i argumentom tipa 
    Int i povratnom vrednoscu koja je takodje tipa Int, to pisemo
    duplo' :: Int -> Int -> Int
-}

duplo' :: Int -> Int
duplo' n = 2*n