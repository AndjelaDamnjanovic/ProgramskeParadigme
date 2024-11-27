-- 2.72 Definisati tip podataka Trougao sa konstruktorima Jednakostranicni, 
--Jednakokraki i Raznostranicni i napisati funkciju koja računa obim instance 
-- tipa Trougao.

-- dodali smo naš tip trougao u tipske razrede Show, Eq i Ord kako bismo pokazali
-- da nam nekad ugrađene funkcije baš i ne odgovaraju za poređenje elemenata
-- tipa koji smo mi definisali (detaljnije opisano u dokumentu "tipovi.md")

data Trougao a b c = Jednakostranicni a
                | Jednakokraki a b
                | Raznostranicni a b c -- deriving (Show, Eq, Ord)

obim :: Trougao Int Int Int -> Int
obim (Jednakostranicni a) = 3 * a
obim (Jednakokraki a b) = a + 2 * b
obim (Raznostranicni a b c) = a + b + c