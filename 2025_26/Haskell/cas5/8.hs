duzina :: [a] -> Int 
duzina l = length l 

{-

not :: Bool -> Bool  
not True = False
not _ = True

(&&) :: Bool -> Bool -> Bool 
True && x = x 
False && _ = False

(g:r), [1,2,3] => g = 1, r = [2,3]
        [1] => g = 1, r = []
-}

duzina' :: [a] -> Int 
duzina' [] = 0
duzina' (x:xs) = 1 + duzina' xs 