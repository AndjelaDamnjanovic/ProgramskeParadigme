# Uvod u Haskell

Programski jezik Haskell je jedan od najpoznatijih predstavnika <b>funkcionalne paradigme</b> (ostali poznati predstavnici su Lisp, Scala, F#... čak i C++ ima mogućnost funkcionalnog programiranja).

Kao i ostali funkcionalni jezici, i Haskell je zasnovan na pojmu <b> matematičke funkcije</b>. Funkcije su <b>građani prvog reda</b>, tj. ne postoje ograničenja prilikom korišćenja funkcija (moguće je funkciju proslediti drugoj funkciji, ili čak vratiti funkciju kao povratnu vrednost druge funkcije). 

Same funkcije su <b>čiste</b>, tj. one u svom računu uzimaju samo vrednosti prosleđenih argumenata, ne uzimajući u obzir nikakva spoljašnja stanja. To je posledica <b>referencijalne transparentnosti</b>  koja zabranjuje postojanje bilo kakvih sporednih efekata, što znači da ukoliko bismo na bilo kom mestu u kodu pozvali `f 3 ` (pozivamo funkciju f sa argumentom 3), uvek bismo dobili isti rezultat, bez obzira na to u kom se mestu u kodu nalazi poziv funkcije.  

Haskell je striktan jezik, strogo tipiziran (ne postoje implicitne konverzije, tipovi se svuda moraju poklapati) i ima jednostavnu sintaksu, iako malo neintuitivnu na prvi pogled.

# Tipski razredi

<b>Preopterećivanje</b> (definisanje iste operacije nad različitim podacima/strukturama podataka) se u Haskell-u ostvaruje preko <b>tipskih razreda</b>. Tipski razred definiše koje funkcije tip mora da implementira da bi pripadao tom tipskom razredu. Tipski razredi koji postoje u programskom jeziku Haskell su:

- <b>Eq</b> (tipovi koji implementiraju samo jednakost i nejednakost): ==, /= 
- <b>Ord</b> (tipovi koji implementiraju poređenja): <, >, <=, >=
- <b>Num</b> (numerički tipovi podataka): +, -, * (<b>Ali ne i deljenje. Prema tome koji je način deljenja implementiran (celobrojno ili razlomačko) tipski razredi se dele na celobrojne i razlomačke  </b>)
- <b> Integral </b> (celobrojni tipovi): mod, div 
- <b> Fractional </b> (razlomački tipovi): /, recip, sqrt...

Veoma je bitno voditi računa o tipovima jer nisu sve funkcije definisane za sve tipske razrede, pa će, ukoliko na primer pozovemo funkciju `sqrt` nad nekim stringom, doći do greške.

# Definisanje funkcija

Kao što je navedeno, u Haskell-u su funkcije građani prvog reda i sve se definiše preko funkcija. Opšti šablon za pisanje funkcije je `ime_funkcije arg1 arg2 ... argn = telo_funkcije`. Ukoliko funkcija nema argumenata, onda je šablon `ime_funkcije = telo_funkcije`.  

Ako se telo funkcije sastoji od samo jedne naredbe, tu naredbu pišemo u nastavku jednakosti. Sa druge strane, ukoliko telo funkcije koju definišemo ima više linija koda, onda je najpre potrebno (iza znaka jednakosti, a pre defiisanja tela funkcije) navesti  ključnu reč `do`, pa tek onda navoditi kod koji će se izvršiti u telu funkcije.

Na primer, ako samo želimo da ispišemo "Hello world" na izlaz, možem definisati funkciju `ispisiPozdrav = print "Hello world"`. Pošto ta funkcija nema argumenata, vidimo da odmah nakon imena funkcije ide njena definicija. 

Ukoliko bismo, pak, hteli da na standardni izlaz ispišemo više teksta koji se nalazi u više linija koda, to radimo na sledeći način: 
 `ispisiPozdrav = do`
       &nbsp;&nbsp;&nbsp;&nbsp;  `print "Hello world" `
       &nbsp;&nbsp;&nbsp;&nbsp;  `print "!". ` Pritom treba napomenuti da je Haskell veoma strog jezik što se tiče indentacije (stroži čak i od Pajtona), pa svaka linija na istom nivou indentacije mora biti jednako indentovana. 

<b>Napomena:</b> Haskell dozvoljava da se u nazivu funkcije nađu mala slova, velika slova, brojevi, specijalni karakteri, pa čak i da se naziv funkcije sastoji samo od specijalnih karaktera. Jedino ograničenje je da <b>prilikom imenovanja funkcija nije dozvoljeno da funkcija počne velikim slovom</b>. Takođe, ukoliko se ime funkcije sastoji samo od specijalnih karaktera, na primer `&&`, onda je obavezno da se njeno ime prilikom definicije, deklaracije i korišćenja stavi unutar običnih zagrada da b interpreter/kompajler znao da se radi o funkciji (u ovom slučaju, odgovarajuća sintaksa bila bi `(&&)`). 
    
# Deklarisanje funkcija

Prilikom pisanja funkcija, nije obavezno prethodno ih deklarisati, jer je Haskell veoma pametan jezik i na osnovu operacija koje se vrše nad argumentima može da zaključi kog su tipa argumenti, ali i rezultat. Ukoliko operaciju koja je korišćena u definiciji funkcije implementira više tipskih razreda, onda će Haskell zaključiti da argumenti pripadaju najopštiji tipski razred. 

Na primer, ukoliko definišemo funkciju `zbir a b = a + b` bez prethodnog deklarisanja i pokrenemo komandu `:i zbir`  (informacije o ovoj komandi navededene su u [ovoj sekciji](#Pokretanje-interpretera)
) u interpreteru dobićemo sledeće podatke o funkciji: [](src/info.png) . Sa leve strane `=>` nalazi se ograničenje, tj. vidimo da je interpreter na osnovu operacija koje smo koristili u definiciji (sabiranje) zaključio najširi mogući tipski razred koji implementira tu funkciju (u ovom slučaju `Num`). Sa desne strane znaka `=>` nalaze se redom tipovi argumentaata i tipovi povratne vrednosti razdvojeni `->`.  Dakle, cela linija koju smo dobili kao povratnu informaciju o tipu može se protumačiti na sledeći način: "funkcija `zbir` prima dva argumenta tipa koji pripada tipskom razredu `Num` i vraća vrednost koja pripada istom tipu".

Sa druge strane, moguće je i ručno deklarisanje funkcije, što je i preporučljivo iz sledećih razloga:

- Čitljivost: ukoliko neko dođe da čita naš kod, odmah će mu iz potpisa funkcije biti jasno šta ta funkcija treba da radi
- Otpornost na greške: ukoliko znamo tipove argumenata i povratne vrednosti, onda je najbolje unapred zadati deklaraciju funkcije jer ukoliko bi došlo do greške u implementaciji (na primer naš kod ne vraća odgovarajući tip podatka na izlazu) kompajler/interpreter će se buniti
- Takođe, ukoilko želimo da naša funkcija radi samo za cele brojeve, možemo unapred izvršiti restrikciju. Tada, ukoliko bi se funkciji prosledila vrednost koja nije celobrojna došlo bi do greške prilikom poziva funkcije. 

# GHC i GHCI

Postoji dosta kompajlera za Haskell, ali najbolji i jedini standardizovani je <b>Glasgow Haskell Compiler</b> (skraćeno GHC).  Uprkos tome što u svom nazivu sadrži reč "kompajler", GHC ima i mogućnost da interpretira kod (zbog interpretera, njegova skraćenica je GHCI). 

Kompajler se može preuzeti sa [zvaničnog sajta za jezik Haskell](https://www.haskell.org/downloads/). 

## Pokretanje kompajlera

Ukoliko želimo da pokrenemo kompajler, moramo najpre definistai funkciju <b>main</b> kako bismo imali ulaznu tačku u programu od koje bi kompajler počeo prevođenje. Neka je jedina uloga funkcije main da ispiše poruku "Hello world!" na standardni izlaz. Odgovarajući kod je `main = print "Hello world!" `. Sačuvamo dati kod u fajlu sa ekstenzijom <b>.hs</b> što je standardna ekstenzija za programski jezik Haskell. 

Pokretanje kompilatora vrši se iz terminala komandom <b>`ghc ime_izvornog_fajla.hs`</b>. Nakon izvršavanja date komande, GHC je napravio izvršni fajl čije se ime poklapa sa imenom izvornog fajla samo ne sadrži ekstenziju. Dakle, ukoliko smo pokrenuli kompajler za fajl pod nazivom 1.hs, ime odgovarajuće izvršne datoteke biće 1. Zatim je potrebno pokrenuti izvršni fajl komandom <b>`./ime_izvršnog_fajla`</b>. Ponovo, ako je izvorni fajl 1.hs, onda ga, nakon kompilacije, izvršavamo sa `./1`.

<b>Napomena:</b> na ovom kursu neće biti korišćen kompajler, već interpreter kako na vežbama, tako i na ispitu. 

## Pokretanje interpretera

Za razliku od kompajlera, interpreter <b>ne zahteva</b> postojanje funkcije `main` da bi kod mogao da se interpretira.  Standardni koraci prilikom korišćenja interpretera podrazumevaju najpre pisanje funkcije, a onda i njeno interpretiranje u cilju testiranja. 

Interpreter se takođe pokreće iz terminala, komandom `ghci`.  Nakon inicijalnog pokretanja interpretera, dobijamo sledeću poruku: [Poruka pri pokretanju interpretera](src/info.png).
Sve komande za interpreter počinju dvotačkom (`:`).  Neke od najkorisnijih naredbi su:

- `:l ime_fajla` (ili `:load ime_fajla`) : omogućava učitavanje fajla (ili više njih) u interpreter 
- `:r` (ili `:reload`) : omogućava ponovno učitavanje svih fajlova koji su u bili učitani u interpreter tokom tekuće sesije (ova opcija je korisna jer se fajl mora interpretirati nakon svake unete izmene)
- `:i ime_funkcije/ime_tipa/ime_tipskog_razreda` (ili `:info ime_funkcije/ime_tipa/ime_tipskog_razreda`) : omogućava dobijanje informacija o funkciji/tipu/tipskom razredu i
- `:h` (ili `:help`) : izlistava sve moguće komande koje se mogu zadati interpreteru. 

Ukoliko se fajl ispravno učitao, dobijamo poruku o tome da je modul učitan [Izgled terminala prilikom uspešnog učitavanja modula](src/uspeh.png). U suprotnom, dobijamo poruku koja sadrži inforamcije o grešci zbog koje fajl nije mogao biti učitan [Izgled terminala prilikom neuspešnog učitavanja modula i poruka o grešci](src/greska.png).

Nakon uspešnog učitavanja fajla u interpreter, možemo pozivati funkcije koje su definisane u tom fajlu (ali naravno i one ugrađene) komandom `ime_funkcije arg1 arg2 ... argn`, gde su sa `arg` obeleženi argumenti koji se prosleđuju funkciji. Interpreter izvršava naznačenu funkciju i vraća njenu povratnu vrednost ukoliko se funkcija ispravno izvršila ili poruku o grešci/upozorenje ukoliko postoji problem pri izvršavanju funkcije (pozivamo funkciju sa argumentima koji nisu odgovarajućeg tipa, ako argumenata ima više/manje nego što funkcija očekuje, ako ponašanje funkcije nije definisano za neke posebne slučajeve kao što je prazna lista...). 

<b>Napomena:</b> Ukoliko znamo de će samo jedan fajl biti učitan u interpreter, onda interpreter možemo pokrenuti i komandom `ghci ime_fajla`što će učitati navedeni fajl u interpreter, nakon čega je odmah moguće pozivati funkcije koje su u tom fajlu definisane. Takođe, ukoliko postoje greške u fajlu, interpreter će to odmah javiti.

# Hoogle

Ukoliko prilikom vežbanja naiđete na probleme (ne znate da li postoji neka ugrađena funkcija u Haskell-u koja može da reši problem ili pak ne znate gde da je nađete i kakav joj je potpis), [Hoogle](https://hoogle.haskell.org/) je pretraživač za Haskell koji omogućava pretragu funkcija po imenu ili potpisu. Takođe, ukoliko želite da saznate nešto više o nekoj strukturi podataka ili tipu (koje sve funkcije su ugrađene), Hoogle i tu može biti od pomoći.