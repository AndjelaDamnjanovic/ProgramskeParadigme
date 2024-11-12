-- 2.35 Napisati funkciju izbaci k l koja izbacuje k-ti element iz liste l.
-- U slučaju da je zadata neispravna pozicija u listi, funkcija vraća 
-- nepromenjenu listu

izbaci _ [] = []
izbaci 0 (_:xs) = xs
izbaci k (x:xs) = x : (izbaci (k-1) xs)