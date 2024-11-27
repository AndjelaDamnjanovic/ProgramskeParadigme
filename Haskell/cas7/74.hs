-- 2.74 Definisati tip podataka Pravougaonik (karakterisan dvema stranicama) i 
--instancirati klase Show i Eq nad kreiranim tipom.

data Pravougaonik = Pravougaonik {a :: Int, b :: Int}

instance Show Pravougaonik where 
    show (Pravougaonik a b) = "(" ++ show a ++ ", " ++ show b ++ ")"

instance Eq Pravougaonik where
    (==) (Pravougaonik a1 b1) (Pravougaonik a2 b2) = a1 == a2 && b1 == b2 || a1 == b2 && b1 == a2

instance Ord Pravougaonik where
    (<=) (Pravougaonik a1 b1) (Pravougaonik a2 b2) = a1 * b1 <= a2 * b2