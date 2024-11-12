# Poklapnje šablona

Poklapanje šablona (eng. <b>pattern matching</b>) je način na koji se veliki broj ugrađenih funkcija definiše za različite tipove/tipske razrede.
Na primer, ukoliko bismo želeli da definišemo jednostavnu bulovsku operaciju `not`, to bismo mogli da uradimo preko dva šablona: mi zadajemo defiicije funkcije gde za argumente koristimo neku vrstu šablona, tj. zadajemo konkretne kombinacije na ulazu za koje znamo kako je definisan izlaz. Dakle, znamo da ako funkcija primi vrednost `True`, ona treba da kao rezultat vrati `False` i obratno. Sada je potrebno samo implementirati funkciju preko šablona, što se radi na sledeći način:

`myNot :: Bool -> Bool`
`myNot True = False`
`myNot False = True`

<b>Kako funkcioniše poklapanje šablona nakon definisanja funkcije?</b>
Kada se funkcija koja je definisana preko šablona pozvala iz interpretera za neku konkretnu vrednost, Haskell bi pokušao da upari prosleđenu vresnost sa prvim šablonom i ako se poklapaju, bila bi vraćena vrednost koja je navedena sa desne strane tog šablona. Ako se prosleđena vrednost ne poklapa sa prvim šablonom, kreće se dalje: najpre drugi, pa ako se ni on ne poklapa treći... Kao povratna vrednost funkcije vraća se ona vrednost koja se nalazi sa desne strane šablona koji je uspešno uparen. Zato je veoma bitno da <b>šabloni pokriju sve moguće slučajeve. Inače, interpreter će se ili zaglaviti u beskonačnoj petlji (ukoliko se zaboravi bazni slučaj) ili će izbaciti upozorenje da nisu definisani šabloni za sve slučajeve.</b>

Dakle, ukoliko bismo ovako definisanu funkciju pozvali u interpreteru komandom `myNot False` interpreter bi prvo proverio prvi slučaj, tj.  `myNot True = False`. Nakon što bi utvrdio da se prosleđena vrednost `False` ne poklapa sa vrednošću šablona `True`, krenuo bi sa daljom proverom. Tada bi uspeo da nađe poklapanje vrednosti `False` sa vrednošću `False` u šablonu `myNot False = True` i vratio `True`. Analogno, ukoliko bismo pozvali funkciju sa argumentom `True` (dakle `myNot True` ) interpreter bi odmah naišao na poklapanje prosleđene vrednosti i šablona i prema tome vratio `False`. Nakon što je jednom došlo do poklapanja šablona, <b>dalji šabloni se ne proveravaju.</b>

Neka je sada zadatak definisati funkciju koja odgovara konjukciji preko šablona. Znamo da postoji 4 moguća slučaja:

`True && True = True`
`True && False = False`
`False && True = False`
`False && False = False`.  Kada bismo ovako definisali našu funkciju ne bismo pogrešili. Ali, ako malo bolje pogledamo, vidimo da je prvi slučaj jedini koji vraća `True`, dok svi ostali vraćaju `False`, pa se pitamo da li je moguće nekako sažeti ovaj zapis. Odgovor je da. Haskell daje opciju korišćenja <b>džokera</b> (takođe se koristi i naziv <b>wildcard</b>), koji se zapisuje kao donja crta (`_`).  On predstavlja opšti slučaj (kao što je na primer `otherwise` u ograđenim jednačinama) i stoga se treba naći kao poslednji definisani šablon. Džoker označava da se na njegovom mestu može naći <b>bilo koja vrednost</b>. Takođe, treba napomenuti da se džokeri mogu naći <b>samo sa leve strane jednakosti</b>. Ako više džokera ulaze u sastav istog šablona, oni su <b>međusobno nezavisni</b>, tj. jedan džoker se može poklopiti sa vrednošću `True`, dok se istovremeno drugi može poklopiti s vrednošću `False`.

Znajući ovo, možemo uprostiti kod:

`myAnd :: Bool -> Bool -> Bool`
`myAnd True True = True`
`myAnd _ _ = False`.  Primetimo da drugi šablon u svojoj definiciji može poklopiti i par vrednosti `True True`. No, i uprkos tome, do tog poklapanja <b>nikad neće doći</b> jer, kao što je već pomenuto, interpreter šablone poklapa <b>redom</b>. Dakle, par `True True` će se uvek poklopiti sa prvim šablonom, te stoga naša funkcija radi baš ono što treba.

Da smo kojim slučajem, obrnuli mesta šablonima, tj. ako bi funkcija bila definisana na sledeći način:
  `myAnd :: Bool -> Bool -> Bool`
  `myAnd _ _ = False`
 `myAnd True True = True`, onda bi se prosleđeni par `True True` najpre poklopio sa prvim šablonom i <b>došlo bi do greške!</b> Zato je šablone sa džokerima potrebno navoditi na kraju.

Međutim, ukoliko ne želimo da se šabloni preklapaju i tako izbegnemo probleme, možemo pomenutu funkciju definisati i na sledeći način:

`myAnd :: Bool -> Bool -> Bool`
`myAnd True x = x`
`myAnd False _ = False`. To znači da ukoliko nam korisnik prosledi vrednosti `True` i nešto drugo, uvek ćemo vratiti upravo to nešto drugo (što ima smisla jer par `True True` vraća `True`, a par `True False` vraća `False`). Sa druge strane, ako je prva vrednost `False` vraćamo `False` bez obzira na to šta se nalazi kao drugi element para. 

# Šabloni liste

Nisu funkcije jedine koje se mogu definisati preko šablona. I operacije nad listom možemo takođe opisati preko šablona. <b>Šablon prazne liste</b> označava se sa `[]`, a <b>šablon neprazne liste </b> sa `(x:xs)`, gde se
`x` poklapa sa glavom liste, a `xs` sa njenim repom. <b> Primetimo da će drugi šablon uspešno poklopiti i listu koja ima samo jedan element</b>: glava će se poklopiti sa tim jednim elementom, a rep će biti prazna lista.

Zašto se lista zapisuje baš sa `:` između glave i repa?
Ukoliko se prisetimo funkcija za rad sa listama, funkcija `:` označava dodavanje elementa na početak liste. Međutim, `:` je ujedno i <b>konstruktor</b> za listu, tj. svaka lista se pravi tako što se elementi dodaju na njen početak. Na primer, lista [1, 2, 3] se (u pozadini) pravi na sledeći način `1 : (2 : (3 : []))`. Dakle, <b>dekonstrukcija liste vrši se pomoću konstruktora.</b> 