data Zivotinja = 
    Pas
    | Macka 
    | Papagaj deriving Show

data Ljubimac = MkLjubimac{
    ime :: String,
    godine :: Int,
    vrsta :: Zivotinja
} deriving Show

stariji :: Ljubimac -> Ljubimac -> Bool 
stariji l1 l2 = godine l1 > godine l2