# Uvod u Python

Programski jezik Pajton jedan je od najpopularnijih programskih jezika. Njegova jednostavnost, intuitivnost, konciznost i čitljivost čine ga ujedno i jednim od najlakših programskih jezika za učenje. Takođe, korisniku su na raspolaganju i brojne biblioteke koje pružaju dodatne funkcionalnosti, čime omogućava programerima da koriste različite paradigme kao što su <b> objektno-orijentisano programiranje, funkcionalno programiranje, proceduralno programiranje itd. </b>. Na ovaj način, omogućeno je rešavanje širokog spektra različitih problema. Stoga programski jezik Pajton nalazi svoju primenu u različitim oblastima: od veb dizajna, preko finansija i automatizacije sve do istraživanja podataka i mašinskog učenja.

## Pisanje programa u Pajtonu
Za razliku od programskog jezika <b> C </b>, Pajton  <b> ne zahteva postojanje ulazne tačke u programu </b>, tj. Pajton programi izvršavaju naredbe onim redom kojim su definisane u programu. Programi pisani u Pajtonu imaju ekstenziju  <b> .py</b>. Da bi Pajton kod mogao da se prevede, potrebno je instalirati  <b> Pajton interpreter </b>. Nakon instalacije, programe je iz terminala moguće pokrenuti komandom  <br> `python3 ime_fajla.py` </br> (ukoliko je instalirana verzija Pajtona koja je veća od 3, inače je dovoljna komanda `python ime_fajla.py`). 


### Ispis na standardni izlaz
Ispis na standardni izlaz vrši se komandom <b> `print(arg1, arg2, ..., argn)` </b>, pri čemu broj argumenata nije ograničen. Ukoliko želimo da ispišemo "Hello world" na standardni izlaz, to možemo uraditi pozivom 
`print("Hello world!")`. Analogno, ako želimo da ispišemo neki broj, to možemo uraditi na sledeći način
`print(3)` (za ispis celih projeva) ili
`print(2.5)`(za ispis realnih brojeva).

 Funkcija `print` može primiti i argumente različitog tipa: `print("Hello world!", 3, 2.5)`. U slučaju postojanja više argumenata, oni se podrazumevano ispisuju u istoj liniji, sa po jednim razmakom između svaka dva elementa. Ukoliko želimo da se između svaka dva elementa ispiše novi red kao separator umesto razmaka, to se može uraditi na sledeći način:
`print("Hello world!", 3, 2.5, sep = "\n")`, gde argument `sep` određuje koji karakter je separator prilikom ispisa. 
<b> Napomena: </b> Primetimo da na kraju jedne komande u Pajtonu <b> nije neophodno staviti terminator. </b>

### Pisanje komentara
Slično C-u i Javi, i Pajton ima opciju pisanja jednolinijskih i višelinijskih komentara. Sami komnetari se ne prevode tokom interpretacije, već služe kao smernice programeru. Jednolinijski komentari počinju znakom `#` i mogu se naći bilo gde u kodu, dok se u slučaju višelinijskih komentara kod nalazi između dva para trostrukih navodnika (`"""`). U nastavku se mogu naći primeri jednolinijskih

`print("Hello world!")   # Ispisujemo nisku na standardni izlaz` 

i višelinijskih komentara.

     " " "
     Ovo je primer
     jednog
     višelinijskog komentara
     !
     " " "

### Promenljive
Promenljive u Pajtonu se dosta razlikuju od promenljivih koje postoje u jezicima poput C-a i Jave. Za početak, <b> ne postoji naredba kojom se vrši deklaracija neke promenljive </b>, već se promenljiva kreira onog trenutka kada joj je dodeljena neka vrednost. To znači da se <b> tip promenljive</b> ne navodi unapred, već se određuje na osnovu vrednosti koja se čuva u njoj. Takođe, promenljive u Pajtonu mogu <b> menjati svoj tip u toku izvršavanja programa </b>. Dakle, moguće je kreirati promenljive na sledeći način:

    x = 5   #promenljiva x će imati tip int
    y = "Hello world!"     #promenljiva y će imati tip string
    x = "Variable changed type"   #promenljiva x je promenila tip i sada je tipa string


Stoga, ukoliko želimo da proverimo kog je tipa neka promenljiva, to možemo uraditi komandom `type(ime_promenljive)`.

### Unos sa standardnog ulaza
U prethodnom delu videli smo kako možemo dodeliti vrednost nekoj promenljivoj. Međutim, u realnim primenama, uglavnom je potrebno da korisnik sam unese vrednost za određenu promenljivu. Čitanje vrednosti koja je uneta sa standardnog ulaza vrši funkcija `input()`:`ucitano = input()`. Ukoliko korisnik želi da se pre učitavanja ispiše poruka korisniku (o tome koju vrednost treba uneti), ta poruka se može proslediti funkciji `input` kao argument: `input("Unesite prirodan broj: ")`.

Prilikom učitavanja potrebno je imati u vidu sledeće stvari:

 - `input()` čita <b> sve dok se ne unese novi red </b>, što znači da će se svi razmaci koji postoje učitati u jednu promenljivu, ne u više njih
 - rezultat koji vraća funkcija `input()` je <b> tipa string </b>, bez obzira da li je uneta vrednost zaista string ili broj/torka/lista ili bilo koji drugi tip.

Dakle, ukoliko želimo da korisnik sa standardnog ulaza unese broj `n`, potrebno je da dobijeni string koji vraća `input` <b> kastujemo </b> u ceo broj. To možemo uraditi na sledeći način:

`n = int(input())`. 

Sa druge strane, ukoliko želimo da unesemo vrednosti više promenljivih, to možemo uraditi na dva načina:

 1. unosimo vrednosti jednu po jednu, svaku u zasebnom redu
 

> a = input("Unesite a: ")
>
> b = input("Unesite b: ")
>
> c = input("Unesite c: ")
>
> d = input("Unesite d: ")

 2. unosimo sve vrednosti u istom redu, pa posle iz njega izdvajamo pojedinačne vrednosti
 

> unosi = input()   #kao što smo pomenuli, fja input() će vratiti string oblika npr. "a b c d" 
> lista = unosi.split(" ") # delimo dobijeni string na delove koji se nalaze između dva razmaka (kao rezultat  
> dobijamo listu. U slučaju našeg primera, lista je oblika ['a', 'b', 'c', 'd']). 
> a =  lista[0] 
> b = lista[1] 
> c = lista[2] 
> d = lista[3] #Tako dobijamo iste vrednosti koje bismo dobili u slučaju 1) da smo ih unosili zasebno



 

### Try-except blok
Razmotrimo sada detaljnije naredbu iz prethodnog primera: `n = int(input())`. Ona ne mora uvek da se izvrši uspešno. Naime, može se desiti da korisnik unese nešto što se ne može kastovati u broj (na primer lista). U tom slučaju, naredba će rezultovati izuzetkom tipa `ValueError` i na standardni izlaz će se ispisati detaljna poruka o grešci. (OVDE IDE SLIKA!!!!!!!!!!!!)

Kako bismo izbegli ove situacije i elegantno rukovali izuzecima, možemo koristiti <b> try-except blokove </b> (konstrukcije analogne try-catch blokovima u Javi). Sintaksa try-except bloka je sledeća:

    try:
		# kod koji može da izazove grešku i izbaci izuzetak
	except [naziv izuzetka koji se hvata - opciono]:
		# reakcija na grešku
			
### Aritmetičke operacije
Nad promenljivama brojevnog tipa mogu se vršiti sve standardne aritmetičke operacije: sabrianje, oduzimanje, množenje, deljenje, celobrojno deljenje, izra;unavanje ostatka pri deljenju i stepenovanje.

    x = 5
    y = 3
	print(x + y) # sabiranje
	print(x - y) # oduzimanje
	print(x * y) # množenje
	print(x / y) # deljenje
	print(x // y) # celobrojno deljenje
	print(x % y) # ostatak pri deljenju
	print(x ** y) # stepenovanje, gde je x osnova, a y eksponent
<b>Napomena: </b> operator sabiranja može da se primeni i na dve promenljive stringovnog tipa i na dve liste. U tom slučaju radi se o <b> konkatenaciji (nadovezivanju) </b>. 

### Relacijski operatori
Pajton podržava i standardne relacijske operatore: poređenje na jednakost i nejednakost, <, >, >= i >=. Kao rezultat poređenja dobijaju se vrednosti `true` ili `false`.

    a = 5
    b = 7
    c = -2
    
    print(a == b) # poređenje na jednakost
    print(a != c) # poređenje na nejednakost
    print(b < c) # provera da li je b manje od c
    print(b > c) # provera da li je b veće od c
    print(a >= c) # provera da li je a veće ili jednako sa c
    print(a <= b) # provera da li je a manje ili jednako od b



### IF
Kao i u ostalim programskim jezicima, i u Pajtonu je moguće proveriti da li je neki uslov ispunjen i u zavisnosti od toga da li jeste ili nije izvršiti određene naredbe. Sintaksa  <b> if naredbe </b> je sledeća:

    if uslov:
	    # kod
Dakle, za razliku od C-a i Jave prilikom postavljanja uslova  <b> nije potrebno stavljati uslov u zagrade </b>. Takođe, umesto vitičastih zagrada koje označavaju početak i kraj bloka naredbi koje se izvršavaju u slučaju da je uslov ispunjen, u Pajtonu za to služe  <b> dvotačka i indentacija </b>. Dvotačka služi kao indikator da iza nje slede  <b> indentovani (uvučeni) blok koda </b>. Indentacija je jedan od ključnih delova sintakse programskog jezika Pajton i koristi se za definisanje bloka koda (analogno vitičastim zagradama u ostalim programskim jezicima).  <b> Sve naredbe u okviru istog bloka moraju biti indentovane na isti način </b>. Ustaljena praksa (a i preporuka) je da se  <b> novi blok koda uvuče za jedan tab u odnosu na prethodni kod </b>, ali je  <b> dozvoljeno umesto taba koristiti i space </b>. Samo je potrebno voditi računa o  <b> doslednosti </b>, tj. ako se jedan blok uvuče tabom, moraju i svi ostali (isto važi i za space). Dakle, nije dozvoljeno mešati tabove i space-ove prilikom indentacije. 

Primer jedne if naredbe:

    a = 10
    if a > 0:
	    print("a je pozitivan broj")
Ukoliko želimo da se neki blok naredbi izvrši i u slučaju da uslov nije ispunjen, možemo ga navesti u `else` delu. Blok koda koji ide iza `else` je takođe indentovan, a ključne reči `if` i `else` se nalaze <b> na istom nivou indentacije </b>. 

    a = -3
    if a > 0:
	    print("a je pozitivan broj")
	else:
		 print("a je negativan broj")

Moguće je takođe proveriti i više uslova koji su međusobno isključivi. U programskim jezicima koje smo do sada videli to je bilo moguće uraditi konstrukcijom else if. I Pajton podržava taj koncept, ali se u njegovoj sintaksi else i if spajaju i dobija se <b> `elif` </b>.

    a = 5
    
    if a % 3 == 0:
	    print("a je deljivo sa 3")
	elif a % 3 == 1:
		print("a daje ostatak 1 pri deljenju sa 3")
	else:
		print("a daje ostatak 2 pri deljenju sa 3")

### Logički operatori
U slučaju da je potrebno u jednoj `if` naredbi proveriti više uslova odjednom, to je moguće uraditi korišćenjem standardnih logičkih operatora: konjunkcija, disjunkcija i negacija. Odgovarajući operatori su redom ključne reči `and`, `or` i `not` (za razliku od ostalih jezika sa kojima smo se susretali, a koji koriste &&, || i !).
Primer disjunkcije: 

    a = 3
    b = 5
    c = 4 
    # želimo da proverimo da li je trougao sa datim stranicama pravougli
    if (a*a + b*b == c or a*a + c*c == b or b*b + c*c == a*a)
	    print("Trougao jeste pravougli")
	else:
	    print("Trougao nije pravougli")

Primer konjunkcije:

    a = 89

    # za proveru da li je a dvocifren, koristimo sledeći uslov
    if (a >= 10 and a < 100)
	    print("Broj jeste dvocifren")
	else:
		print("Broj nije dvocifren")
Primer negacije:

    if not 0:
	    print("Uslov je ispunjen")

 

### Definisanje funkcija
Funkcije u Pajtonu predstavljaju  <b> imenovane blokove naredbi  </b>. Sintaksa za definiciju funkcije je:

    def ime_funkcije(arg1, arg2, ..., argn):
	    # telo fje
Ključna reč `def` se koristi da označi da se na tom mestu definiše jedna korisnički definisana funkcija, čije je ime `ime_funkcije`. Funkcija koja se definiše ne mora imati nijedan argument, a može ih imati proizvoljno mnogo. Prilikom prosleđivanja argumenata, ne mora se proslediti tip argumenta, već je dovoljno proslediti ime promenljive, a interpreter će u zavisnosti od vrednosti koja se čuva u memoriji zaključiti kog tipa je promenljiva. Pošto je funkcija blok koda, neophodno je da to eksplicitno naznačimo korišćenjem `:` i indentacije. Sve naredbe u telu funkcije je potrebno jednako indentovati.  

    def radni_dan(dan):
	    # ako su dani u mesecu numerisani od 1 do 30, želimo da vratimo True 
	    # (ako je u pitanju radni dan), a False inače
	    if dan % 7 == 6 or dan % 7 == 0:
		    # pošto imamo naredbu if, potrebno je dodatno indentovati blok unutar nje 
		    return False
		 else:
			 return True

### Moduli math i random
Moduli u Pajtonu predstavljaju ekvavalent bibliotekama u drugim programskim jezicima - to su fajlovi koji sadrže definicije funkcija, klasa, promenljivih itd. Da bi se funkcije/promenljive/klase iz nekog modula koristile u glavnom programu, potrebno je <b> importovati (uvesti) taj modul </b>. Uvoženje modula radi na sledeći način `import ime_modula`. Zatim, kada u kodu želimo da iskoristimo neku funkciju koja se nalazi u uvezenom modulu, to možemo uraditi sa `ime_modula.ime_funkcije(argumenti)`. 

Na primer, u modulu <b> math </b> mogu se naći često korišćene matematičke funkcije: faktorijel, koren, stepenovanje, logaritam, sinus, kosinus i slično. Na sledećem primeru demonstrirana je upotreba datog modula:

    import math

	print(math.factorial(6)) # računamo faktorijel od 6
	print(math.log(125, 5)) # ispisuje vrednost logaritma od 125 sa osnovom 5
	print(math.pow(4, 2)) # ispisuje se kvadrat broja 4 

<b> Random </b> je još jedan veoma koristan modul. On sadrži funkcije koje generišu pseudo-slučajne brojeve. Iako sama funkcija `random` generiše brojeve iz intervala [0, 1), taj interval se raznim transformacijama može svesti na bilo koji drugi interval.

    import random
    print(random.random()) # ispisuje pseudo-slučajan broj iz intervala [0,1)

Mana gore opisanog importovanja modula je ta da se odjednom uvozi ceo modul, sa svim svojim funkcijama, promenljivama i klasama, što potencijalno može dodatno usporiti program. Uvoženje celog modula ima smisla onda kada ćemo u kodu koristiti većinu funkcionalnosti koje on nudi. Sa druge strane, ukoliko ćemo koristiti samo par funkcija iz celog modula, možemo uvesti samo njih. To se radi naredbom `from ime_modula import imena_funkcija`. Ukoliko uvezemo funkcije na ovaj način, prilikom njihovog pozivanja u kodu možemo koristiti samo njihovo ime, bez naziva modula.

    from math import sqrt, pow
	
	print(pow(4, 2))
	print(sqrt(16))
	
### While petlja
Sintaksa `while` petlje u Pajtonu slična je sintaksi iz C-a ili Jave:

    while uslov_ispunjen:
	    # blok naredbi
Na primer, ukoliko želimo da učitavamo reči sa standardnog ulaza dok se ne unese reč "quit", to možemo uraditi na sledeći način:

    unos = input()
    while unos != "quit":
	    print(unos)
	    unos = input()
Takođe, moguće je izaći iz petlje posle nekog broja iteracija ili kada neki uslov bude ispunjen. Izlaz iz petlje obezbeđuje se komandom `break`.

    i = 0
    while True:
	    i += 1 # Pajton NE PODRŽAVA i++
	    
	    if (i == 10):
		    # želimo da izađemo iz petlje nakon 10 iteracija
		    break
	    