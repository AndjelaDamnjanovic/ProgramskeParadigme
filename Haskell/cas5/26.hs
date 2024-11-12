-- 2.26 Napisati funkciju parni a b koja generiše listu parnih celih 
--brojeva iz segmenta [a, b] i funkciju neparni a b koja generiše 
--listu neparnih celih brojeva iz segmenta [a, b] .

-- zadatak se lako moze resiti koriscenjem list generatora (ekvivalent
--list comprehension-u u Pajtonu)

-- list generator: [x | x <- domen, uslovi_koji_vaze]
parni :: Int -> Int -> [Int]
parni a b = [x | x <- [a..b], even x]

neparni :: Int -> Int -> [Int]
neparni a b = [x | x <- [a..b], odd x]
