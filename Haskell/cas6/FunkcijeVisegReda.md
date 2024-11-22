# Funkcije višeg reda

<b>Funkcije višeg reda</b> su one funkcije koje kao argument primaju neku drugu funkciju ili kao rezultat vraćaju funkciju. Podsećanja radi, u programskom jeziku Pajton viđene su funkcije `map, filter i reduce` koje spadaju u funkcije višeg reda. Pandani ovim funkcijama postoje i u Haskelu, ali se u ovom funkcionalnom programskom jeziku može naći još dosta funkcija koje spadaju u funkcije višeg reda. 

# Map

Kao i u Pajtonu, i u programskom jeziku Haskel dostupna je ugrađena funkcija `map`. Njen potpis možemo dobiti pozivanjem `:i map` iz interpretera i on izgleda ovako: `map :: (a -> b) -> [a] -> [b]`. Pre prelaska na objašnjenje šta i kako funkcija `map` radi, potrebno je reći zbog čega uopšte postoje zagrade u zapisu. Setimo se da ukoliko ovih zagrada ne bi bilo bismo potpis funkcije tumačili kao "funkcija map prima argument tipa `a`, argument tipa `b`, listu elemenata tipa `a` i vraća listu elemenata tipa `b`".  No, zagrade menjaju značenje potpisa. Ukoliko sada izdvojimo samo segment u zagradama `(a -> b)` i posmatramo ga nezavisno od ostatka potpisa, možemo uočiti da se on sam za sebe može tumačiti kao funkcija i to kao funkcija koja prima argument tipa `a` i vraća rezultat tipa `b`. Dakle, <b>ukoliko se funkciji kao argument prosleđuje druga funkcija, to se radi tako što se potpis prosleđene funkcije piše u zagradama</b>. Takođe, kao što se iz potpisa može videti <b>funkcija koja se prosleđuje funkciji `map` mora biti unarna</b> (primati jedan argument). Dakle, opšti potpis funkcije `map` je: `map unarna_funkcija lista_elemenata`.  

## Kako radi funkcija `map`?

Funkcija `map` funkcioniše isto kao i u Pajtonu. Ona primenjuje prosleđenu funkciju na svaki element liste i kao rezultat vraća listu rezultujućih elemenata. Neka je `f` funkcija koju želimo da primenimo na sve elemente liste, a `x1, x2,..., xn` elementi te liste. Slikovito, funkcija map radi na sledeći način:

    map f [x1, x2, x3, ..., xn] = [f x1, f x2, ..., f xn]

Tako, na primer, ukoliko bismo želeli da uvećamo sve elemente liste za 1, to bismo mogli da uradimo na sledeći način:
 `uvecaj lista = map (+1) lista`,  gde je `(+1)` ugrađena funkcija za sabiranje kojoj je jedan element fiksiran (i to drugi u ovom slučaju). Fiksiranje elemenata moguće je zbog <b>karijevanja</b>.  Slično, ukoliko bismo želeli da izvadimo koren iz svih elemenata liste, to bi takođe bilo moguće korišćenjem funkcije 
 `koren lista = map sqrt lista`. 

Naravno, funkciji `map` se ne moraju proslediti samo ugrađene funkcije, već je moguće proslediti i korisnički definisane funkcije. Na primer, ako bismo u prvom primeru želeli da mi napišemo svoju funkciju koja će da uvećava elemente i da nju kasnije prosledimo funkciji `map`, to bi se moglo uraditi na sledeći način:
 

    uvecaj1 n = n + 1
    uvecaj lista = map uvecaj1 lista
# Filter

Sledeća bitna funkcija je `filter`. Kao i u Pajtonu, <b>ona nam služi da iz liste elemenata izdvojimo samo one koji zadovoljavaju neki uslov</b>. Odgovarajući potpis je: `filter :: (a -> Bool) -> [a] -> [a]`. Dakle, i `filter` prima unarnu funkciju i listu elemenata tipa `a` i vraća kao povratnu vrednost listu elemenata tipa `a`. Međutim, unarna funkcija koja se prosleđuje funkciji `filter` mora biti <b>funkcija uslova</b>, tj. njena povratna vrednost mora biti tipa `Bool`. 

## Kako radi funkcija `filter`?

Funkcija `filter` radi tako što primeni dobijenu funkciju na svaki element liste i ukoliko je rezultat primene prosleđene funkcije na argument `True`, onda element ostaje u listi. U suprotnom, element se briše iz liste. 

Ukoliko bismo želeli da izdvojimo sve pozitivne elemente iz liste, to bismo mogli da uradimo na sledeći način: 

    pozitivni lista = filter (>0) lista
Ponovo, `(>0)` je unarna funkcija koja proverava da li je element liste veći od 0 (<b>pažnja: funkcija `>` nije komutativna, pa je veoma bitno da li stoji `>0` ili `0>` jer će ispravnsot rezultata zavisiti od toga kojim su redom navedeni operator i fiksirani argument</b>). Takođe, opet nismo morali da korsitimo ugrađenu funkciju, već je bilo moguće da koristimo neku koju smo mi prethodno definisali.

# Foldr

Za razliku od funkcija `map i filter`, Pajtonska funkcija `reduce` nema svog jedinstvenog parnjaka u Haskelu. Funkcije koje odgovaraju datoj funkciji u Hakelu nazvane su `foldr` i `foldl`. 

Krenimo za početak od funkcije `foldr`.  Njen potpsi izgleda ovako: 
`foldr :: (a -> b -> b) -> b -> t a -> b`. Dakle, `foldr` kao prvi argument dobija binarnu funkciju (sa argumentima tipa `a` i `b` i povratnom vrednošću tipa `b`), zatim argument tipa `b` (koji se naziva <b>akumulator</b>), te <b>kolekciju elementata tipa `a`</b> (označeno sa `t a` u potpisu) i vraća vrednost tipa `b`.  Ova funkcija enkapsulira sledeći šablon rekurzije:

    f [] = v - f preslikava praznu listu u vrednost v `
    `(v je najčešće prazna lista ili vrednost 0, ali u zavisnosti 
    od potrebe, može uzimati i druge vrednosti)`
 ` f (x:xs) = x op (f xs) - nepraznu listu preslikava u funkciju op primenjenu na glavu liste (x) i f od repa liste (f xs)`.

Na primer, ukoliko bismo želeli da izvršimo sabiranje svih elemenata liste korišćenjem funkcije `foldr` to bismo mogli da uradimo na sledeći način:

    saberi lista = foldr (+) 0 lista

## Kako radi funkcija `foldr`?

Demonstrirajmo sabiranje liste na konkretnom primeru. Neka je lista elemenata koje treba sabrati `l = [1,2,3,4]`. Bazni slučaj jeste prazna lista i njen zbir je 0. Dakle, `saberi [] = 0`. Za ostale slučajeve, dovoljno je da pratimo šablon `f (x:xs) = x op (f xs)`. Znamo da je `:` konstruktor liste, pa ćemo je koristiti da najpre dekonstruišemo listu na sastavne delove. Naša lista u rastavljenom obliku izgleda ovako: `[1 : 2 : 3 : 4 : []]`.  Primenjujući pomenuti šablon dobijamo:
`saberi [1 : 2 : 3 : 4 : []] = 1 + (saberi [2 : 3 : 4 : []])`
`saberi [2 : 3 : 4 : []] = 2 + (saberi [3 : 4 : []])`
`saberi [3 : 4 : []] = 3 + (saberi [4 : []])`
`saberi (4 : []) = 4 + saberi []`.  Ako bismo želeli da rezultat napišemo u jednom redu, rešenje bi izgledalo ovako: `saberi [1,2,3,4] = (1 + (2 + (3 + (4 + 0))))`. Dakle, yagrade se kod funkcije `foldr` <b>gomilaju na desnu stranu</b>.

# Foldl
Funkcija slična funkciji `foldr`, a koja takođe odgovara funkciji `reduce` iz Pajtona jeste funkcija `foldl`. Njen potpis (`foldl :: (b -> a -> b) -> b -> t a -> b`) je sličan kao i potpis funkcije `foldr`, ali ih ne treba mešati! `Foldl` enkapsulira sledeći šablon:
`f [] = rez1, gde rez1 ponovo najčešće uzima vrednosti 0 ili [], ali može uzeti i neku drugu vrednost po potrebi`
`rez1 op el2 = rez2`
`rez2 op el3 = rez3`
`...`
`rez(n-1) op eln = rezn`. U prevodu, prvi argument je dosadašnji međurezultat, dok je drugi argument element koji se trenutno obrađuje. 

## Kako radi `foldl`?

`Foldl` radi slično kao `foldr`, sa jednim malim izuzetkom: on gomila zagrade na levu stranu i počinje od `rez1` kao prvog međurezultata. Dakle, ukoliko bismo opet hteli da saberemo elemente liste, ali ovoga puta koristeći funkciju `foldl`, to bi izgledalo ovako:
`saberi [] = 0`
`saberi [1 : 2 : 3 : 4 : []] = (0 + 1) + saberi [2 : 3 : 4 : []]`
`saberi [2 : 3 : 4 : []] = ((0 + 1) + 2) + saberi [3 : 4 : []]`
`saberi [3 : 4 : []] = (((0 + 1) + 2) + 3) + saberi [4 : []]`
`saberi [4 : []] = ((((0 + 1) + 2) + 3) + 4) + saberi []`.

<b>Napomena: paziti pri korišćenju funkcija `foldr` i  `foldl` jer za nekomutativne operacije ne dobijaju se isti rezultati, pa je veoma bitno koja se od ove dve funkcije foristi!</b>
[Primer razlike rezultata izvršavanja foldr i foldl funkcije](../src/folds.png)

# Takewhile i dropWhile

Prošle nedelje, pomenute su funkcije `take n lista` i `drop n lista` koje zadržavaju/odbacuju prvih `n` elemenata liste. Međutim, ukoliko bismo želeli da sačuvamo/odbacimo prvih `m` elemenata liste koji zadovoljavaju određen uslov, pri čemu `m` nije unapred poznato, to možemo uraditi pomoću funkcija `takeWhile` i `dropWhile` respektivno. Obe imaju isti potpis:
`takeWhile :: (a -> Bool) -> [a] -> [a]`
`dropWhile :: (a -> Bool) -> [a] -> [a]`, tj. obe primaju funkciju uslova (kao i filter) i listu elemenata tip `a` i vraćaju listu elemenata tipa `a`.  S tim što `takeWhile` vraća najduži prefiks liste koji ispunjava uslov, a `dropWhile` taj najduži prefiks odbacuje.

Ukoliko bismo želeli da izdvojimo najduži prefiks pozitivnih eleemnata iz neke liste, to možemo uraditi funkcijom `izdvojPrefiksPozitivnih lista = takeWhile (>0) lista`. Sa druge strane, ako bismo te pozitivne elemente želeli da odbacimo, to bi lako bilo moguće uraditi funkcijom `odbaciPrefiksPozitivnih lista = dropWhile (>0) lista`.

# Any i all
Ako bismo želeli da proverimo da li neki eleemnt liste zadovoljava neko svojstvo ili da li svi elementi liste zadovoljavaju neko svojstvo to možemo uraditi korišćenjem funkcija `any` i `all` respektivno. Ponovo, obe funkcije imaju isti potpis:
`any :: Foldable t => (a -> Bool) -> t a -> Bool`
`all :: Foldable t => (a -> Bool) -> t a -> Bool`. Obe primaju funkciju uslova i kolekciju elemenata tipa `a` i vraćaju `Bool` koji govori da li neki/svi elementi zadovoljavaju prosleđeno svojstvo. Pritom, treba primetiti da `any` i `all` kao svoj argument primaju tipove koji su `Foldable`, tj. one tipove i strukture podataka koji se mogu svesti na jednu vrednost (ukoliko bismo dobili listu `Int` vrednosti, mogli bismo celu listu da preslikamo u jednu vrednost: bilo zbir liste, proizvod liste ili njenu dužinu). 

Ukoliko bismo želeli da proverimo ima li u listi pozitivnih brojeva, to bismo uradili uz pomoć funkcije: 
`imaPozitivnih lista = any (>0) lista`. A ako bismo želeli da proverimo da li su svi elementi liste negativni, onda bismo iskoristili funkciju:
`sviNegativni lista = all (<0) lista`.

# Or i and
Još neke zanimljive funkcije jesu `or` i `and`. Oni predstavljaju uopštenje klasičnih binarnih operatora `||` i `&&` redom i mogu se primeniti na cele liste bulovskih vrednosti (dok su `||` i `&&` takođe implementirani u Haskelu, ali se mogu primeniti samo na 2 vrednosti). Obe funkcije imaju isti potpis:
`or :: Foldable t => t Bool -> Bool`
`and :: Foldable t => t Bool -> Bool`. I one imaju ograničenja po pitanju toga koji tipovi mogu da se proslede kao argumenti. 

Neki od primera upotrebe: 
`or [True, True, False] = True`
`and [True, True, False] = False`.

