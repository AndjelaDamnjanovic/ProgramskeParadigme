## Zagonetke u Prologu

Zagonetke u Prologu predstavljaju jedan od najilustrativnijih primera logičkog programiranja. Umesto da se problem rešava nizom eksplicitnih koraka, kao u imperativnim jezicima, u Prologu se zagonetka opisuje skupom **činjenica** i **pravila**, dok sam Prologov mehanizam zaključivanja pronalazi rešenje. Dakle, Prolog se koristi kao **rešavač**. Programer ne govori *kako* da se dođe do rešenja, već *šta* važi u svetu problema.

## Modelovanje problema

Tipične logičke zagonetke, poput zadataka tipa „ko živi u kojoj kući“, „ko nosi koju masku“ ili „ko ima koju osobinu“, lako se modeluju u Prologu. Entiteti se predstavljaju pomoću struktura ili lista struktura, dok se uslovi zagonetke zapisuju kao ograničenja. Elementi svake strukture su **atomi**. Na primer, može se definisati da određena osoba ne može imati neku osobinu, da se dva elementa nalaze jedan pored drugog ili da jedan element mora da se pojavi pre drugog u listi.

## Zaključivanje i pretraga

Prolog koristi **unifikaciju** i **bektreking** kako bi automatski pretraživao prostor mogućih rešenja. Jedna od velikih prednosti je što isti skup pravila može služiti i za proveru i za generisanje rešenja. Postavljanjem upita sa promenljivama, Prolog može pronaći sve kombinacije koje zadovoljavaju zadate uslove, bez potrebe za dodatnim kodom.

## Prednosti i izazovi

Iako su zagonetke u Prologu elegantne i bliske ljudskom načinu razmišljanja, potrebno je pažljivo pisati pravila. Loše strukturisana pravila mogu dovesti do velikog broja nepotrebnih pokušaja ili ponavljanja istih rešenja. Zbog toga je praksa da se koriste tehnike optimizacije poput pravilnog redosleda ciljeva ili korišćenje **cut operatora** (`!`) ako želimo samo jedno rešenje datog problema.

## Kako modelovati problem?
Pre nego što se pristupi samom modelovanju problema, potrebno je detaljno iščitati tekst zadatka i tokom čitanja uočiti šta mogu biti **entiteti** i koje su njihova **svojstva**. Na primer, ukoliko treba da odredimo za svaku kuću koje je boje, osoba koje nacionalnosti živi u njoj, šta jede, šta pije i kog kućnog ljubimca drži, onda upravo kuća može biti entitet, dok će ostale informacije (boja, nacionalnost, jelo, piće i ljubimac) biti njena svojstva. Označimo entitet kuće strukturom **k** (skraćeno od kuća). Dakle, jedan entitet je **struktura** oblika: `k(boja, nacionalnost, jelo, piće, ljubimac)`. Ako je poznato da ima 5 kuća, onda je potrebno **svaku kuću ponaosob predstaviti strukturom**. Idealan način za čuvanje više struktura je **lista**. 

**Napomena:** svojstva je moguće zadati u **bilo kom redosledu**, ali, onda kada je redosled definisan, potrebno je držati ga se do kraja kako bi Prolog mogao uspešno da reši zagonetku.

Nakon identifikacije entiteta i svojstava, može se napisati predikat koji će rešavati datu zagonetku. Pošto je potrebno samo modelovati zagonetku, predikat nema nikakve ulazne parametre, ali je potrebno da ima izlaz: rešenje problema, pa je potrebno napraviti predikat arnosti jedan. Najpre je potrebno rešenje **unifikovati** sa listom struktura. Recimo da je poznato da ima 5 kuća koje odgovaraju prethodnom opisu. Tada se definicija predikata može napisati kao:
 

    kuce(L) :- L = [k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _)].
Anonimne promenljive su tu da sugerišu da se na tom mestu može naći bilo šta. Zatim, potrebno je ponovo iščitati zadatak i uneti sve dostupne informacije. Na primer, ukoliko želimo da napišemo činjenicu da Englez živi u crvenoj kući, to možemo uraditi tako što ćemo reći da je struktura koja sadrži polja "Englez" i "crvena" **član** naše liste. Da bismo to uradili, potrebno je napisati  predikat član koji će primati element i listu. Definicija ovakvog predikata glasi:

    clan(X, [X|_]). % X se nalazi na početku liste
    clan(X, [_|R]):- clan(X, R). % ili se X nalazi negde u repu

  Zatim, potrebno je dodati informaciju da je kuća u kojoj živi Englez crvene boje. To se može uraditi na sledeći način:
  

    kuce(L) :- L = [k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _)],
				    clan(k(crvena, englez, _, _, _), L).

  **Napomena:** Pošto su sve nacionalnosti atomi, **neophodno ih je pisati malim slovom, jer se u suprotnom smatraju promenljivim**. Ukoliko baš želite da koristite velika slova, potrebno je da atom napišete između dvostrukih navodnika: npr. "Englez".

 ## Fiksiranje vrednosti i imenovane promenljive

Do sada su u strukturama korišćene **anonimne promenljive** (`_`) kako bi se naznačilo da neka svojstva nisu unapred poznata. Međutim, u mnogim zagonetkama je deo informacija poznat već na početku i te vrednosti je moguće **fiksirati direktno u definiciji problema**.

Na primer, ukoliko je poznato da se u prvoj kući pije voda, tada se to može izraziti tako što se odgovarajuća vrednost unapred zada u strukturi:

    kuce(L) :-
        L = [k(_, _, _, voda, _),
             k(_, _, _, _, _),
             k(_, _, _, _, _),
             k(_, _, _, _, _),
             k(_, _, _, _, _)].

Na ovaj način se Prologu eksplicitno govori da u prvoj kući piće mora biti voda, dok su ostala svojstva te kuće, kao i sve osobine ostalih kuća, i dalje nepoznate.


Pored fiksnih vrednosti, u Prologu se mogu koristiti i **imenovane promenljive**. One omogućavaju da se nepoznate vrednosti zadrže i koriste u daljim uslovima, bilo radi povezivanja različitih entiteta, bilo radi uvođenja ograničenja nad tim vrednostima.

Na primer, ukoliko je poznato da se pas ne nalazi u crvenoj kući, to možemo zapisati na sledeći način:

    kuce(L) :- L = [k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _),
				    k(_, _, _, _, _)],
				    clan(k(crvena, englez, _, _, _), L),
				    clan(k(crvena, _, _, _, Ljubimac), L),
				    Ljubimac \== pas.

Promenljiva `Ljubimac` predstavlja nepoznatu vrednost, ali nam omogućava da nad tom vrednošću postavimo dodatno ograničenje. Na ovaj način se jasno vidi razlika između anonimne promenljive, koja se ne može dalje koristiti, i imenovane promenljive, koja se može ograničavati ili povezivati sa drugim delovima problema.
**Napomena:** pošto su svojstva termovi, koristimo znak za nejednakost termova (\==).





