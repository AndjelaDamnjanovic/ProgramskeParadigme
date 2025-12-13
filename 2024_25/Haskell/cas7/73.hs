-- 2.73 Definisati tip podataka Zivotinja koji može biti Pas, Macka ili Papagaj. 
--Zatim definisati tip Ljubimac (karakterisan imenom, godinama i tipom zivotinje).

-- ovaj primer služi za demonstriranje korišćenja imenovanih parametara i da 
-- jedan tip može da bude deo nekog drugog tipa

data Zivotinja = Pas | Macka | Papagaj deriving Show
data Ljubimac = Ljubimac  {
    ime :: String,
    godine :: Int,
    vrsta :: Zivotinja
} deriving Show

stariji :: Ljubimac -> Ljubimac -> Bool
stariji l1 l2 = (godine l1) > (godine l2)