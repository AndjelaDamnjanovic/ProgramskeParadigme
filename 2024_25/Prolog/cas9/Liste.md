# Liste 

Liste u Prologu predstavljaju niz <b>termova</b>. Pri tom treba napomenuti da lista može biti niz različitih termova (numeričkih, kombinovanih, kompozitnih...) i mogu biti proizvoljne dužine. 

Kao i u Haskelu, i u Prologu postoji više načina za definisanje liste:

* preko konstruktora: konstruktor liste u Prologu je `.`, pa se lista koja se sastoji od glave i repa u Prologu konstruiše na sledeći način:

	`. (g, r)`. Ukoliko bismo želeli da napravimo recimo listu elemenata od 1 do 3, to bismo korišćenjem konstruktora mogli da uradimo na sledeći način:
	
	`.(1, .(2, .(3, [])))`. Ovde vidimo da se šabloni za praznu listu u Haskelu i Prologu poklapaju. Međutim, ovaj pristup je veoma nepraktičan, pogotovo za višečlane liste.
* zadati elemente liste u uglastim zagradama: 
  `[1,2,3]` ili, `[1,2,a]` ili `[X, Z]` ili `[1, a, X, 1 + b]`...

# Šabloni liste
Kao i Haskel, i Prolog nudi mogućnost korišćenja šablona za lakši rad sa listama. Pored već pomenutog šablona za praznu listu (`[]`), na raspolaganju su još i:

* `[X]` - šablon jednočlane liste
* `[X, Y]`  - šablon dvočlane liste (analogno, može se primeniti na isti način i na više elemenata liste ukoliko je to potrebno, mada najčešće nije)
* `[G|R]` - šablon neprazne liste (može da poklopi i jednočlanu)
* `[X, Y|R]` - šablon koji se koristi ako hoćemo da lista ima bar dva elementa (ovaj šablon može se koristiti do proizvoljne dubine liste, samo je pre repa potrebno navesti odgovarajući broj elemenata)

# Unifikacija šablona liste i vrednosti

Kako unifikacija predstavlja jedan od najvažnijih procesa u Prologu, sada ćemo opisati način na koji se šabloni liste unifikuju sa vrednostima koje se nalaze u listi.

* Ukoliko pokušamo da unifikujemo listu od jedne promenljive sa listom od jedne vrednosti, onda promenljiva dobija upravo vrednost te promenljive:

    | ?- [X] = [1]  
    X = 1
    yes
* Ukoliko pokušamo da unifikujemo listu od jedne promenljive sa listom od više vrednosti, onda dobijamo odgovor da ne postoji odgovarajuća unifikacija:
    
	| ?- [X] = [1,2,3]

    no
* Analogno sa prvim slučajem, unifikacija liste od 2 promenljive sa listom od dve vrednosti vrši se tako što se prvoj promenljivoj dodeli prva vrednost druge liste, a drugoj promenljivoj druga vrednost liste s kojom se vrši unifikacija:

    | ?- [X, Y] = [1, 2]

    X = 1

    Y = 2

    yes
* Međutim, moguće je unifikovati i sledeće liste:
    | ?- [X, 2] = [1, Y]

    X = 1
    
	Y = 2
    
	yes
* Ukoliko želimo da unifikujemo liste koristeći šablon neprazne liste, to možemo uraditi na sledeći način:
    
	| ?- [G | R] = [1, 2, 3, 4, 5] 
    
	G = 1 
    
	R = [2,3,4,5] 
    
	yes
* Treba napomenuti da ukoliko bismo pokušali sa unifikacijom dvočlane liste opisane preko šablona za nepraznu listu i dvočlane liste, ne bismo dobili isti rezultat kao u trećoj tački:

    | ?- [G | R] = [1, 2]         
    
	G = 1 
    
	R = [2]
    
	yes 
	
Pitamo se zašto dolazi do ove razlike pošto je u suštini reč o istom primeru. Odgovor leži u činjenici da je su u šablonu [X, Y] i X i Y šabloni koji menjaju konkretne vrednosti, dok u šablonu [G|R], G poklapa glavu liste, a R rep, koji je sam po sebi <b>lista</b>. Stoga je rezultat koji smo dobili na ovom primeru: R se <b>poklopilo sa listom od jednog elementa, a ne sa samim elementom</b>. 

# Ugrađeni predikati za proveru tipa

Nekada želimo da definišemo predikat koji ne radi za sve tipove, već samo za određene. Na primer, ukoliko bismo želeli da izračunamo sumu elemenata liste, to ne bismo mogli da uradimo ukoliko neki term nije numerički. Stoga bismo pre obrade svakog elementa želeli najpre da proverimo kog je on tipa, pa da ga tek onda obradimo, ukoliko je odgovarajućeg tipa za dati predikat. Za proveru kog je tipa term postoje sledeći ugrađeni predikati: 

`atom(arg)` - proverava da li je prosleđeni term atom

`number(arg)` - proverava da li je prosleđeni term broj

`atomic(arg)` - proverava da li je prosleđeni term atom ili broj

`float(arg)` - proverava da li je prosleđeni term broj u pokretnom zarezu

`integer(arg)` - proverava da li je prosleđeni term ceo broj

`real(arg)` - proverava da li je prosleđeni term realan broj

`var(arg)` - proverava da li je prosleđeni term promenljiva

`nonvar(arg)` - proverava da li prosleđeni term nije promenljiva