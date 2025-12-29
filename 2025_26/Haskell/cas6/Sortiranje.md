# Sortiranje

Kao i u ostalim programskim jezicima, i u Haskelu postoje ugrađene funkcije za sortiranje. Pošto se sortiranje može izvršiti samo nad kolekcijom podataka istog tipa, ove ugrađene funkcije nalaze se u modulu za rad sa listama -- <b>Data.List</b>, pa je zato prilikom njihovog korišćenja potrebno (pre definisanja bilo kakvih funkcija) uvesti dati modul komandom `import Data.List`.

Klasično sortiranje obezbeđuje nam funkcija `sort :: Ord a => [a] -> [a]`. Kao što se vidi iz potpisa, funkcija `sort` prima samo jedan argument -- listu koju je potrebno sortirati i vraća listu sortiranih elemenata. Za međusobno poređenje dva elementa liste, funkcija `sort` koristi još jednu ugrađenu funkciju: `compare :: a -> a -> Ordering` (koja prima dva elementa, a vraća njihovo <b>uređenje</b>: GT (greater then), EQ (equal) ili LT (less then)) i na osnovu nje pravi poredak elemenata. Sortiranje elemenata liste vrši se <b>rastuće</b>. Pritom treba napomenuti da se tipovi poput `Int, Double, String, Char` porede na isti način kako smo navikli (po svojoj vrednosti), dok se parovi uređuju najpre rastuće po prvom elementu, pa onda (ukoliko su prvi elementi jednaki) rastuće po drugom elementu para.

Sa druge strane, ukoliko želimo da listu sortiramo opadajuće primetićemo da ne postoji način da funkciji `sort` prosledimo još jedan argument koji govori u kom poretku bismo želeli da sortiramo, pa je potrebno dovijati se na drugi način da bi se došlo do rešenja. Jedan od načina za prevazilaženje ovog problema jeste jednostavno obrtanje rastuće sortirane liste (uz pomoć ugrađene funkcije `reverse` koju smo pominjali pri radu sa listama). Drugi način je da nekako napravimo <b>inverz</b> funkcije `compare` kako bi se elementi ređali u opadajućem poretku. Haskel, srećom, ima ugrađenu funkciju koja baš to radi -- to je funkcija `flip :: (a -> b -> c) -> b -> a -> c` koja obrće redosled argumenata koji se prosleđuju funkciji, praveći tako njen inverz. 

Ukoliko bismo, dakle, hteli da sortiramo niz brojeva opadajuće uz pomoć funkcije `compare`, to bismo mogli uraditi na sledeći način:
`sort (flip compare) [1, 2, -4, 5]`.

Međutim, ukoliko treba porediti neke komplikovanije tipove podataka (npr. poređenje korisnički definisanih tipova podataka), često nije moguće koristiti ugrađenu funkciju `compare`. Samim tim, standardna funkcija `sort` je u tom slučaju beskorisna. No, Haskel nudi i mogućnost korišćenja funkcije <br> `sortBy :: (a -> a -> Ordering) -> [a] -> [a]
` koja kao svoj prvi argument prima funkciju poređenja koju korisnik definiše. Uz to, ova funkcija prima i listu elemenata koju treba sortirati i vraća listu sortiranih elemenata. Primetimo da, ukoliko želimo da sortiramo elemente opadajuće, sada nema potrebe da pribegavamo trikovima, dovoljno je samo definisati funkciju za poređenje na odgovarajući način.

Pokušajmo da sortiramo listu parova rastuće po drugom elementu para korišćenjem funkcije `sortBy`. Najpre je potrebno definisati odgovarajuću funkciju koja će da vrši poređenje elemenata: <br>
`poredi a b = compare (snd a) (snd b)`. 
Alternativno, mogli smo da izbegnemo korišćenje funkcije `snd` tako što bismo parove zamenili njihovim šablonima: <br>
`poredi' (p, q) (r, s) = compare q s`. Sada je samo potrebno pozvati funkciju za sortiranje: <br>
`sortParDrugiRastuce lst = sortBy poredi lst`. Funkcija bi radila isto da je `poredi` zamenjeno sa `poredi'`.

I, na kraju, još jedna ugrađena funkcija za sortiranje je funkcija `sortOn :: Ord b => (a -> b) -> [a] -> [a]` koja kao svoj prvi argument prima ključ po kome treba sortirati listu, a zatim i listu elemenata koju je potrebno sortirati, te vraća listu čiji su elementi uređeni u željenom poretku. Ona takođe koristi funkciju `compare` kako bi poredila dva elementa liste.

Ukoliko bismo opet želeli da sortiramo listu parova opadajuće po drugom elementu para, ali sada korišćenjem funkcije `sortOn`, to bi bilo moguće na sledeći način: najpre je potrebno odrediti šta je ključ po kome treba sortirati elemente. Ukoliko bi taj ključ bila vrednost drugog elementa para, lista bi bila sortirana rastuće jer se u osnovi za poređenje koristi funkcija `compare`.  Ali, primetimo da, ako bismo negirali vrednost drugog elementa para, dobili bismo baš ono što želimo -- sortiranje opadajuće. Stoga je konačno rešenje:
`sortParDrugiOpadajuce lst = sortOn (negate.snd) lst`, gde je `negate.snd` funkcija ključa koja najpre uzima drugi element para, a zatim ga negira, te funkcija `compare` sada sortira po vrednostima koje su dobijene kompozicijom ove dve funkcije.

# Rekapitulacija

Dakle, videli smo 3 funkcije za sortiranje. Sve 3 se nalaze u modulu `Data.List`, te ga moramo importovati ukoliko želimo da koristimo ove funkcije. 

Funkcija `sort` vrši sortiranje kolekcije rastuće korišćenjem funkcije `compare`. 

Funkcija `sortBy` sortira elemente liste pomoću naše funkcije za sortiranje.

Funkcija `sortOn` sortira elemente liste pomoću funkcije `compare` primenom funkcije ključa nad elementima. 