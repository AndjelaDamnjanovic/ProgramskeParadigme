type Tacka = (Float, Float)

tacka :: Float -> Float -> Tacka
tacka x y = (x, y)

o :: Tacka
o = tacka 0.0 0.0

x :: Tacka -> Float
x (x1, _) = x1

y :: Tacka -> Float
y (_, y1) = y1

transliraj :: Tacka -> Float -> Float -> Tacka
transliraj (x, y) x1 y1 = tacka (x + x1) (y + y1) 

rastojanje :: Tacka -> Tacka -> Float
rastojanje (x1, y1) (x2, y2) = sqrt $ (x1 - x2)^2 + (y1 - y2)^2

uKrugu :: Float -> Tacka -> Bool
uKrugu r t = rastojanje t o < r

type Putanja = [Tacka]

duzina :: Putanja -> Int
duzina p = length p

nadovezi :: Tacka -> Putanja -> Putanja
nadovezi t p = p ++ [t]

spojPutanje :: Putanja -> Putanja -> Putanja
spojPutanje p1 p2 = p1 ++ p2

kvadrant :: Tacka -> Int
kvadrant (x, y) 
    | x > 0 && y > 0 = 1
    | x < 0 && y > 0 = 2
    | x < 0 && y < 0 = 3
    | x > 0 && y < 0 = 4
    | otherwise = 0

kvadrantPutanje :: Putanja -> Int
kvadrantPutanje p = if all (== x) xs then x else 0
    where (x:xs) = map kvadrant p

tackeUKvadrantu :: Int -> [Tacka] -> [Tacka]
tackeUKvadrantu kv ts = filter ((== kv). kvadrant) ts
-- tackeUKvadrantu kv ts = [x | x <- ts, kvadrant x == kv]

tackeVanKvadranta :: Int -> [Tacka] -> [Tacka]
tackeVanKvadranta kv ts = filter ((/= kv). kvadrant) ts

maksimumi :: [Tacka] -> (Float, Float)
maksimumi ts = (maxFst, maxSnd)
    where maxFst = foldl max x xs
          maxSnd = foldl max y ys
          (x:xs) = map fst ts
          (y:ys) = map snd ts