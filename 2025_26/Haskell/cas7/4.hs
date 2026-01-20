data Trougao a b c = 
    Jednakostranicni a
    | Jednakokraki a b 
    | Raznostranicni a b c
    deriving (Show, Eq)

obim :: Trougao Float Float Float -> Float
obim (Jednakostranicni a) = 3 * a 
obim (Jednakokraki a b) = a + 2 * b 
obim (Raznostranicni a b c) = a + b + c 
