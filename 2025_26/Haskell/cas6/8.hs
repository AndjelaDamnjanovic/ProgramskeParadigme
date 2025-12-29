list_elem x [] = False
list_elem x (y:xs) = if x == y then True else list_elem x xs

list_elem' x l =  (or.map (==x)) l
