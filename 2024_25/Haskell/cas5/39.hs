{-2.39 U toku je prijavljivanje za seminar na temu IT problemi. Zbog 
ograničenog broja mesta, sa liste prijavljenih se mogu primiti samo oni 
čiji je redni broj prijave manji od kapaciteta sale za održavanje 
seminara. Napisati funkciju primljeni n lista koja deli listu prijavljenih
na dve liste na osnovu kapaciteta sale n, prva lista sadrži prvih n 
elemenata i predstavlja učesnike seminara, a druga lista sadrži ostatak i 
predstavlja prijavljenje koji se stavljaju na listu
čekanja za sledeći termin održavanja-}

primljeni :: Int -> [String] -> [[String]]
primljeni n lst = [take n lst, drop n lst]