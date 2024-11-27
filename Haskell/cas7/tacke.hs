-- Napraviti nov tip podataka Tačka koji će predstavljati tačku u 2D. Koordinate 
-- tačke su realne vrednosti. 

type Tacka = (Float, Float)

-- Napisati funkciju tačka koja predstavlja konstruktor klase Tačka i prima x i y 
-- koordinatu tačke, a vraća Tačku sa odgovarajućim koordinatama
tacka :: Float -> Float -> Tacka
tacka x y = (x, y)

-- Instancirati objekat tipa Tačka koji će predstavljati koordinatni početak
o :: Tacka
o = tacka 0.0 0.0

-- Napisati funkcije x i y koji će predstavljati getere za odgovarajuću koordinatu
-- tipa Tačka

x :: Tacka -> Float
x (x1, _) = x1

y :: Tacka -> Float
y (_, y1) = y1

-- Napisati funkciju transliraj koja dobija tačku, kao i dve vrednosti za koje treba
-- translirati tačku po x i y koordinati. 

transliraj :: Tacka -> Float -> Float -> Tacka
transliraj (x, y) x1 y1 = tacka (x + x1) (y + y1) 

-- Napisati funkciju rastojanje koja računa euklidsko rastojanje između dve tačke.

rastojanje :: Tacka -> Tacka -> Float
rastojanje (x1, y1) (x2, y2) = sqrt $ (x1 - x2)^2 + (y1 - y2)^2

-- Napisati funkciju uKrugu koja dobija poluprečnik kruga čiji se centar nalazi
-- u koordinatnom početku i tačku i proverava da li se tačka nalazi unutar kruga.

uKrugu :: Float -> Tacka -> Bool
uKrugu r t = rastojanje t o < r

-- Napraviti nov tip podataka Putanja koja će predstavljati listu tačaka.

type Putanja = [Tacka]

-- Napisati funkciju dužina koja računa dužinu prosleđene putanje.

duzina :: Putanja -> Int
duzina p = length p

-- Napisati funkciju nadoveži koja će dobiti tačku i putanju i nadovezati tačku na 
-- putanju dodajući je na kraj.

nadovezi :: Tacka -> Putanja -> Putanja
nadovezi t p = p ++ [t]

-- Napisati funkciju spojPutanje koja će primati dve putanje i nadovezati drugu na kraj
-- prve.

spojPutanje :: Putanja -> Putanja -> Putanja
spojPutanje p1 p2 = p1 ++ p2

-- Napisati funkciju kvadrant koja će za dobijenu tačku vratiti u kom se ona kvadrantu 
-- nalazi. Ukoliko se tačka nalazi na nekoj od osa, vratiti 0.

kvadrant :: Tacka -> Int
kvadrant (x, y) 
    | x > 0 && y > 0 = 1
    | x < 0 && y > 0 = 2
    | x < 0 && y < 0 = 3
    | x > 0 && y < 0 = 4
    | otherwise = 0

-- alternativno rešenje: korišćenjem tipa Maybe
--kvadrant' :: Tacka -> Maybe Int
--kvadrant' (x, y) 
--    | x > 0 && y > 0 = Just 1
--    | x < 0 && y > 0 = Just 2
--    | x < 0 && y < 0 = Just 3
--    | x > 0 && y < 0 = Just 4
--    | otherwise = Nothing

-- Napisati funkciju kvadrantPutanje koja će, ukoliko su sve njene tačke u istom 
-- kvadrantu vratiti taj kvadrant, a inače 0. 
-- U prevodu, ako imamo tačke (1,1) i (2,3) u putanji, ova funkcija treba da vrati 1
-- jer se obe tačke nalaze u prvom kvadrantu.
-- Sa druge strane, ista funkcija za tačke (1,1) i (-1,-1) treba da vrati 0 jer se one
-- ne nalaze u istom kvadrantu. 

kvadrantPutanje :: Putanja -> Int
kvadrantPutanje p = if all (== x) xs then x else 0
    where (x:xs) = map kvadrant p

-- ukoliko bismo želeli da napišemo funkciju kvadrantPutanje koja koristi funkciju
-- kvadrant', to bismo uradili slično:

-- kvadrantPutanje' :: Putanja -> Maybe Int
-- kvadrantPutanje' p = if all (== x) xs then x else Nothing
--    where (x:xs) = map kvadrant p

-- Napisati funkciju tackeUKvadrantu koja dobija redni broj kvadranta i listu tačaka
-- i vraća listu tačaka iz originalne liste koje se nalaze u željenom kvadrantu.

tackeUKvadrantu :: Int -> [Tacka] -> [Tacka]
tackeUKvadrantu kv ts = filter ((== kv). kvadrant) ts
-- tackeUKvadrantu kv ts = [x | x <- ts, kvadrant x == kv]
-- tackeUKvadrantu kv ts = filter (\el -> kvadrant el == kv) ts

-- Napisati funkciju tackeVanKvadranta koja dobija redni broj kvadranta i listu tačaka
-- i vraća listu tačaka iz originalne liste koje se nalaze van zadatog kvadranta.
tackeVanKvadranta :: Int -> [Tacka] -> [Tacka]
tackeVanKvadranta kv ts = filter ((/= kv). kvadrant) ts

-- Napisati funkciju maksimumi koja za prosleđenu listu tačaka vraća uređeni par tako
-- da je je prvi element para maksimalna prva koordinata prosleđenog niza tačaka, a 
-- drugi element maksimalna vrednost druge koordinate istog niza.
 
maksimumi :: [Tacka] -> (Float, Float)
maksimumi ts = (maxFst, maxSnd)
    where maxFst = foldl max x xs
          maxSnd = foldl max y ys
          (x:xs) = map fst ts
          (y:ys) = map snd ts