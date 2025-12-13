-- 2.4 Napisati funkciju korenCeli n koja računa realni koren celog 
--broja n korišćenjem ugrađene funkcije sqrt

{-
    Prva asocijacija je verovatno napisati funkciju na sledeci nacin

    korenCeli :: Int -> Double
    korenCeli n = sqrt n

    Ali, ovaj nacin nece raditi, tj. proizvesce gresku. Zasto?
    Rekli smo da je Haskell veoma strog jezik i da se svi tipovi
    moraju poklapati. Ukoliko se u terminalu potraze informacije o
    funkciji sqrt komandom :i sqrt videcemo da sqrt prima argument
    koji pripada tipskom razredu Fractional, a Int to nije. Stoga je
    najpre potrebno prevesti vrednost argumenta n u tip Fractional,
    pa tek onda pozvati sqrt nad dobijenim rezultatom. 

    Ugradjena funkcija koje prevodi tip Integral u tip Fractional
    je fromIntegral
-}

korenCeli :: Int -> Double 
korenCeli n = sqrt (fromIntegral n)

-- Napomena - zagrade su dodate jer bi se inace fja sqrt primenila samo
-- na ono sto sledi direktno iza nje, a to je fja fromRational i tako
-- bi se dobila greska 