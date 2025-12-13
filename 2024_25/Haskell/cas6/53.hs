{-2.53 Definisati funkciju delioci n koja pravi listu delilaca datog 
prirodnog broja n korišćenjem funkcije filter. Korišćenjem prethodne 
funkcije definisati funkciju prost n koja proverava da li je dati prirodan
broj n prost. Dodatno, korišćenjem funkcije prost i komprehensije lista 
definisati funkciju prosti n koja određuje sve proste brojeve od 1 do n.-}

jeDelilac n d= mod n d == 0 
delioci n = filter (jeDelilac n) [2..(n-1)]

prost n = null (delioci n)

prosti n = [x | x<- [2..n], prost x]