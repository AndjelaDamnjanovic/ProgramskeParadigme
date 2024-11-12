# Liste

<b>Liste</b> su osnovne strukture podataka u programskom jeziku Haskell. One predstavljaju kolekciju vrednosti <b>istog tipa</b> i mogu biti proizvoljne dužine (pa čak i beskonačne). Sastoje se od <b>glave</b> (prvi element liste) i <b>repa</b> (svi elementi liste osim prvog). Podsetimo se, postoji više načina za definisanje liste:

- mogu konstruisati tako što se jednostavno navedu elemenati liste unutar uglastih zagrada

    `lista1 = [1, 2, 3, 4, 5]`
    
 - ili tako što se zadaju početna i krajnja  tačka intervala razdvojenih
    sa dve uzastopne tačke 
    `lista2 = [1..7]`

 - ukoliko ne želimo da lista sadrži sve uzastopne elemente, već samo neke (koji se nalaze na jednakom rastojanju jedni od drugih) moguće je dodati i korak tako što se navedu prva dva elemeta liste, kao i poslednji
    `lista3 = [1, 3..9]`
 - U Haskell-u moguće je defnisati i beskonačnu listu tako što se samo navede prvi element (ili prva dva elementa)

	`lista4 = [1..]`
	`lista5 = [1, 5..]`
- moguće je napraviti i listu elemenata u opadajućem poretku ukoliko postoji korak na osnovu kog Haskell može da zaključi šablon po kom se dodaju elementi liste

`lista6 = [10, 9 .. 2]`

<b>Napomena:</b> ukoliko bismo pokušali da definišemo listu opadajućih elemenata samo navođenjem početnog i krajnjeg elementa kao rezultat dobili bismo <b>praznu listu!</b> To je zato što Haskell proverava interval i ukoliko je prvi element veći od drugog, on automatski zaključuje da je to nevalidan opseg i vraća praznu listu. 

Do sada smo videli samo liste celobrojnih brojeva, ali liste mogu sadržati i druge tipove podataka: Double, String, Char, torke, druge liste...

`listaDouble = [1.2, 3.4, 5.6]`
    `listaString = ["Ovo", "je", "lista", "stringova"]`
    `listaTorke = [(1,3.5, "str"), (2, 7.4, "neki string")]`
    `listaListi = [["lista", "stringova"], ["druga", "lista"], []]`
    `listaChar = ['L', 'i', 's', 't', 'a']`

<b>Napomena:</b> Ukoliko nakon kreiranja liste karaktera ukucamo `listaChar` u terminalu, kao rezultat dobićemo jedan string - "Lista". 
<b>U Haskell-u niske su implementirane upravo kao liste karaktera.</b>

# Funkcije za rad sa listama

Neke od najbitnijih funkcija koje olakšavaju rad sa  listama <b>proizvoljnog tipa </b> su:

- konkatenacija (operator ++): 
`lista = [1..5]`
`lista2 = [6..10]`
`lista ++ lista2`
- dodavanje na pocetak (operator :): `1:[2..10]`
- indeksni pristup (operator !!): `[1..10] !! 5`
- provera da li je element u listi: `elem 3 [1..10]`
- izdvajanje glave liste: `head [1..10]`
- izdvajanje repa liste: `tail [1..10]`
- dobijanje duzine liste: `length [1..10]`
- uzimanje prvih `n` elemenata s početka liste: `take 4 [1..10]`
- odstranjivanje prvih `n` elemenata s početka liste: `drop 4 [1..10]`
- obrtanje liste: `reverse [1..10]`
- pravljenje liste od `n` istih elemenata: `replicate 3 [1..10]` 



Ukoliko imamo listu <b>numeričkih tipova podataka</b>, moguće su i sledeće operacije:
- sabiranje svih elemenata liste: `sum [1..10]`
- proizvod svih elemenata liste: `product [1.1, 2.2 ..9.9]`

Za  <b>liste listi</b> obezbeđena je i  mogućnost spajanja sadržaja svih podlisti u jednu listu:
`concat [[1..10], [11..20], [21..30], []]`

# Liste u potpisu funkcije

Pisanje liste u potpisu funkcije radi se tako što se unutar uglastih zagrada navede tip elemenata. Na primer, ukoliko bismo želeli da definišemo funkciju `lista` koja će primati dva cela broja (koja predstavljeju početni i krajnji element liste) i kao rezultat vraćati odgovarajuću listu elemenata, potpis bi izgledao ovako: 
`lista :: Int -> Int -> [Int]`
Analogno bi se pisali i potpisi za liste ostalih tipova podataka: `[Double], [[Int]], [Char], [(Int, Double)]...`