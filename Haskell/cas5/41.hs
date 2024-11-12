{-2.41 Učesnici nagradne igre Sedmica zadaju kombinacije od sedam 
različitih pozitivnih brojeva manjih od 30, nakon čega se generiše 
dobitna kombinacija. Glavnu nagradu dobija učesnik koji je pogodio svih sedam brojeva, a utešne nagrade oni koji su imali veći broj pogodaka
od promašaja u svojoj kombinaciji. Napisati funkcije:
a) pogodak ucesnikL dobitnaL - vraća par (a, b) takav da a predstavlja broj pogodaka, a b
broj promašaja u kombinaciji učesnika koja je zadata listom ucesnikL na osnovu dobitne
kombinacije, liste dobitnaL.-}


-- ukoliko u funkciji imamo ponavljanje koda, ono se moze resiti klauzom
-- where, gde cemo definisati alijas za neku vrednost i posle taj alijas
-- koristiti u kodu
pogodak :: [Int] -> [Int] -> (Int, Int)
pogodak ucesnik dobitna = (a, 7-a)
    where a = length [x | x<-ucesnik, elem x dobitna]

-- deo pod b) ostaje za vezbu