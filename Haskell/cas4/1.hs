-- jednolinijski komentari u Haskell-u

{-
    Ovako se 
    u programskom
    jeziku Haskell pisu viselinijski
    komentari
-}

-- 2.1 Napisati funkciju main koja ispisuje poruku Zdravo! 
{-
    Kao sto je u uvodnom materijalu napomenuto, ukoliko funkcija
    u svojoj definiciji ima samo jednu naredbu, pisemo je u jednom
    redu. Posto cemo imati definisanu main funkciju, kod je moguce
    kompajlirati komandom ghc 1.hs, pa nakon toga i izvrsiti dobijeni 
    izvrsni fajl sa ./1-}

main = print "Zdravo!"


-- Ukoliko bi nasa funkcija main imala vise komandi, onda bi kod bio 
main' = do
    print "Zdravo"
    print " svete"

-- Druga funkcija nazvana je main' jer Haskell ne podrzava vise
-- funkcija istog imena

-- Napomena: voditi racuna o indentaciji prilikom pisanja vise naredbi
-- Napomena2: fajl se moze i interpretirati