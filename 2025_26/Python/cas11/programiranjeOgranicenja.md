# Programiranje ograničenja (Constraint Programming)

## 1. Opšte informacije

Programiranje ograničenja (Constraint Programming, CP) predstavlja paradigmu programiranja u kojoj se problem ne rešava opisivanjem tačnog algoritma, već se opisuje kroz skup uslova koje rešenje mora da ispuni. Umesto pitanja _kako_ doći do rešenja, fokus je na pitanju _šta_ mora biti tačno da bi se neko rešenje smatralo ispravnim. Ovakav pristup je posebno pogodan za probleme sa velikim brojem kombinacija, gde bi klasični algoritamski pristup bio komplikovan ili neefikasan.

Svaki problem u programiranju ograničenja sastoji se iz tri osnovne komponente: promenljivih, njihovih domena i ograničenja. Promenljive predstavljaju nepoznate vrednosti koje želimo da odredimo. Domeni definišu skup dozvoljenih vrednosti za svaku promenljivu, dok ograničenja opisuju odnose koji moraju važiti između promenljivih. Rešenje problema je svaka dodela vrednosti promenljivima koja zadovoljava sva postavljena ograničenja.

 Na primer, ukoliko želimo da napravimo raspored časova, jedno ograničenje bi bilo da jedan profesor ne može da drži više predavanja istovremeno. Analogno, ni studenti jedne godine studija ne bi trebalo da više obaveznih predmeta imaju u istom terminu. Takođe, u jednoj učionici se može održavati samo jedan predmet u jednom terminu. Sve su ovo **ograničenja** koja nam pomažu da pronađemo neko rešenje koje zadovoljava sve uslove (idealan slučaj). Međutim, u realnim primenama često nije moguće naći rešenje koje zadovoljava sve uslove. U tim slučajevima, često se bira rešenje koje zadovoljava najviše uslova.

Programiranje ograničenja se najčešće koristi za rešavanje takozvanih problema zadovoljenja ograničenja (Constraint Satisfaction Problems), kao što su logičke zagonetke, problemi raspoređivanja, bojenje grafova, problemi dodeljivanja resursa i mnogi drugi kombinatorni problemi. Njegova snaga leži u visokom nivou apstrakcije i čitljivosti modela, ali cena toga može biti manja kontrola nad performansama u poređenju sa ručno optimizovanim algoritmima.

## 2. Programiranje ograničenja u Bprologu

Bprolog je jedan od najprirodnijih jezika za programiranje ograničenja, jer je zasnovan na logičkom programiranju i deklarativnom opisu problema. To nam omogućava rad sa ograničenjima nad konačnim domenima celobrojnih promenljivih.

U Prologu, promenljive su logičke promenljive koje u početku nemaju konkretnu vrednost. Njihova vrednost se postepeno sužava kako se dodaju nova ograničenja. Na primer, ako za promenljivu X kažemo da pripada domenu od 1 do 10, a zatim dodamo ograničenje da je X veće od 7, domen se automatski sužava na skup {8, 9, 10}. Ovaj proces se naziva propagacija ograničenja.

Glavni koraci rešavanja nekog problema ograničenja svodi se na 3 koraka:
<ul>
	<li>definicija promenljivih i njihovih domena</li>
	<li>definisanje ograničenja (sistemska ili korisnički definisana)</li>
	<li>instanciranje</li>
</ul>

Domen promenljive u Prologu predstavlja skup dozvoljenih celobrojnih vrednosti koje ta promenljiva može da uzme. Domen se obično zadaje eksplicitno, najčešće kao interval ili kao konačan skup vrednosti. Neka je `X` neka promenljiva, kojoj treba dodeliti vrednost iz domena D. Postoje dva moguća načina za definisanje domena:

    X in D ili
    X :: D
Ukoliko više promenljivih mogu uzimati vrednosti iz istog domena, moguće je umesto jedne promenljive navesti celu listu promenljivih:

    [X, Y] in D
    [A, B, C] :: D1
Domen se može zapisati kao 
<ul>

<li>lista mogućih vrednosti:
	

    X in [1,4,2,6,8]

</li>
	<li> neprekidan domen [a, b]:
	
    X in 1..10

</li>
<li> domen sa korakom,  oblika [a, a+i, a + 2i, ..., a + ni]. Na primer, ukoliko želimo sve neparne brojeve iz domena [1, 10]

    X in 1..2..10

</li>
</ul>

Sledeći korak je pisanje ograničenja. Korisnički definisana ograničenja podrazumevaju pisanje izraza dobijenih korišćenjem relacionih operatora: =, \=, <, =<, >, >=. Važno je naglasiti da u programiranju ograničenja aritmetička jednakost nije isto što i klasična unifikacija. Umesto operatora =, koriste se specijalni operatori poput #=, #=, #< i slični, koji predstavljaju aritmetička ograničenja. Stavljanje oznake # ispred ograničenja omogućava da se provera zadovoljenja ograničenja odlaže do trenutka kada su **vrednosti promenljivih poznate**. Promenljive mogu ostati nedefinisane sve dok se eksplicitno ne zatraži njihovo instanciranje.

Što se sistemskih ooraničenja tiče, najčešće se upotrebljavaju:

`alldifferent(Vars)` - obezbeđuje da sve promenljive iz liste `Vars` imaju različite vrednosti (može se koristiti i `alldistinct(Vars)`)

`atmost(N, L, V)` - obezbećuje da **najviše** `N` promenljivih iz liste `L` uzme vrednost `V`

`atleast(N, L, V)` - obezbećuje da **najmanje** `N` promenljivih iz liste `L` uzme vrednost `V`

`exactly(N, L, V)` - obezbećuje da **tačno** `N` promenljivih iz liste `L` uzme vrednost `V`

Pretraga konkretnih vrednosti se u Prologu pokreće pozivom predikata labeling. Tek tada sistem sistematski isprobava moguće vrednosti iz domena promenljivih, vodeći računa o svim postavljenim ograničenjima. Pored običnog pronalaženja bilo kog rešenja, Bprolog omogućava i rešavanje **optimizacionih problema** korišćenjem opcija `minimize` i `maximize` unutar predikata `labeling`. U tom slučaju, cilj nije samo da se pronađe rešenje koje zadovoljava sva ograničenja, već ono koje je optimalno u odnosu na neki kriterijum.

Ideja je sledeća: jedna promenljiva (ili aritmetički izraz) predstavlja meru kvaliteta rešenja, kao što su ukupni trošak, vreme izvršavanja ili broj iskorišćenih resursa. Opcija `minimize` nalaže rešavaču da traži rešenje sa najmanjom mogućom vrednošću te mere, dok `maximize` traži rešenje sa najvećom vrednošću. Tokom pretrage, sistem pamti trenutno najbolje pronađeno rešenje i koristi ga za dodatno sužavanje prostora pretrage.

Na primer, u problemima raspoređivanja može se minimizovati ukupno vreme trajanja rasporeda, dok se u problemima dodele resursa može maksimizovati iskorišćenost kapaciteta. Ovakav pristup omogućava da se programiranje ograničenja koristi ne samo za zadovoljenje uslova, već i za pronalaženje najboljeg mogućeg rešenja u okviru zadatih ograničenja.

Prednost Prologa u programiranju ograničenja je njegova izražajnost i bliska veza sa matematičkom logikom. Problemi se često mogu opisati vrlo kratko i jasno. Međutim, performanse mogu značajno zavisiti od načina na koji je definisana pretraga i redosleda promenljivih, što zahteva iskustvo i razumevanje rada rešavača.

Primer jednog problema dat je ispod:

    problem :- Vars = [X, Y, Z], % definisanje promenljivih
    
    % nakon definicije promenljivih, sledi određivanje domena za svaku od njih
    X :: 1..90, % ili X in 1..90 
    Y :: 2..2..60, 
    Z :: 0..10..100,
	   
	% uvođenje ograničenja
    X #>= Z,
    2 * X + X * Y + Z #=< 34,
    
	% instanciranje promenljivih
    labeling(Vars),

	% ispis rešenja
    write('X = '), write(X), write(', Y ='), write(Y), write(', Z = '), write(Z), nl,
	% ukoliko želimo da rešavač nađe sva rešenja odjednom, možemo mu eksplicitno 
	% reći da nađeno rešenje nije ono koje mi želimo (korišćenjem predikata fail)
    fail.

## 3. Programiranje ograničenja u Pajtonu


U Pajtonu se programiranje ograničenja najčešće realizuje pomoću biblioteke **python-constraint**, koja pruža jednostavan i čitljiv način za modelovanje problema zadovoljenja ograničenja. Za razliku od Bprologa, gde je programiranje ograničenja deo samog jezika, u Pajtonu se sve eksplicitno gradi kroz objekte i funkcijske pozive.

Problem se najpre definiše kreiranjem objekta koji predstavlja model ograničenja. Nakon toga se uvode **promenljive**, pri čemu se za svaku promenljivu eksplicitno navodi njen domen mogućih vrednosti. Domeni su obično predstavljeni kao liste ili opsezi celobrojnih vrednosti. Na ovaj način se jasno ograničava prostor pretrage već u startu.

**Ograničenja** se u python-constraint biblioteci najčešće definišu kao funkcije koje vraćaju logičku vrednost. Takve funkcije opisuju odnos koji mora važiti između jedne ili više promenljivih. Kada se ograničenje doda u model, solver ga automatski primenjuje na sve relevantne kombinacije vrednosti promenljivih. Pored korisnički definisanih ograničenja, biblioteka nudi i određena **sistemska (ugrađena) ograničenja**, kao što su ograničenja nejednakosti (`AllDifferentConstraint`), zbirnih vrednosti(`ExactSumConstraint`) ili zahtevi da sve promenljive u nekom skupu imaju različite vrednosti. Ova ugrađena ograničenja su optimizovana i efikasnija od ručno pisanih provera.

Kada je model kompletno definisan, rešavanje problema se pokreće pozivom metode `getSolution()` ili `getSolutions()`. Metoda `getSolution()` vraća jedno proizvoljno rešenje koje zadovoljava sva ograničenja, dok `getSolutions()` vraća listu svih mogućih rešenja. Izbor između ove dve metode zavisi od toga da li je cilj pronaći samo jedno validno rešenje ili analizirati ceo prostor rešenja.

Važno ograničenje python-constraint biblioteke jeste to što ona **nema direktnu podršku za optimizaciju**, odnosno ne poseduje ugrađene mehanizme ekvivalentne `minimize` i `maximize` opcijama iz Prologa. Ukoliko je potrebno pronaći optimalno rešenje, sva validna rešenja se moraju najpre generisati, a zatim se optimalno bira ručno, poređenjem vrednosti ciljne funkcije. Zbog toga je python-constraint pogodniji za čiste CSP probleme, dok se za optimizacione zadatke često kombinuje sa drugim alatima ili solverima. 

Primer čije je rešenje već dato u Prologu, u Pajtonu se može rešiti na sledeći način:

    import constraint

	problem = constraint.Problem() # pravimo instancu klase Problem

	#dodajemo promenljive
	problem.addVariable('X', range(1, 91))
	problem.addVariable('Y', [2 * i for i in range(1, 31)]) 
	problem.addVariable('Z', [i * 10 for i in range(0, 11)])

	#definisemo ogranicenja
	def o1(x, z):
    return x >= z 

	def o2(x, y, z):
    return 2 * x + x * y + z <= 34

	problem.addConstraint(o1, "XZ")
	problem.addConstraint(o2, "XYZ")

	# dajemo rešavaču da reši zadati problem
	# Jedno rešenje predstavlja mapu čiji su ključevi promenljive, a vrednosti vrednost iz domena koja je dodeljena datoj promenljivoj
	solutions = problem.getSolutions()
	
	#ispisujemo sva rešenja
	for solution in solutions:
    print("X = ", solution['X'], ", Y = ", solution['Y'], " Z = ", 	solution['Z'])



## 4. Poređenje Prologa i Pajtona

Razlika između Prologa i Pajtona u programiranju ograničenja ogleda se pre svega u stilu. Prolog nudi čist deklarativni pristup, gde se problem opisuje gotovo kao skup matematičkih formula. Pajton, sa druge strane, kombinuje deklarativne elemente sa imperativnim tokom programa, što ga čini fleksibilnijim, ali i manje formalno čistim.

Prolog je posebno pogodan za obrazovne i istraživačke svrhe, gde je važno jasno razumeti logiku problema i propagaciju ograničenja. Pajton je češći izbor u industrijskim primenama, gde je potrebna dobra integracija sa drugim softverskim komponentama.

