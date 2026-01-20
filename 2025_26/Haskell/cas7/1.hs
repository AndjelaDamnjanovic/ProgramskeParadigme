import Data.Char

broj :: String -> Bool 
broj s = all (isDigit) s

mala :: String -> Bool 
mala s = all (isLower) s

sifruj :: [String] -> [String]
sifruj [] = []
sifruj (x:xs) =
    if (broj x) then ("C" ++ x ++ "C") : sifruj xs
    else if (mala x) then ("M" ++ x ++ "M") : sifruj xs
    else ("O" ++ x ++ "O") : sifruj xs