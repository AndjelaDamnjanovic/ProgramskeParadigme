# Uvod u Python

Programski jezik Pajton jedan je od najpopularnijih programskih jezika. Njegova jednostavnost, intuitivnost, konciznost i čitljivost čine ga ujedno i jednim od najlakših programskih jezika za učenje. Takođe, korisniku su na raspolaganju i brojne biblioteke koje pružaju dodatne funkcionalnosti, čime omogućava programerima da koriste različite paradigme kao što su <b> objektno-orijentisano programiranje, funkcionalno programiranje, proceduralno programiranje itd. </b>. Na ovaj način, omogućeno je rešavanje širokog spektra različitih problema. Stoga programski jezik Pajton nalazi svoju primenu u različitim oblastima: od veb dizajna, preko finansija i automatizacije sve do istraživanja podataka i mašinskog učenja.

## Pisanje programa u Pajtonu
Za razliku od programskog jezika <b> C </b>, Pajton  <b> ne zahteva postojanje ulazne tačke u programu </b>, tj. Pajton programi izvršavaju naredbe onim redom kojim su definisane u programu. Programi pisani u Pajtonu imaju ekstenziju  <b> .py</b>. Da bi Pajton kod mogao da se prevede, potrebno je instalirati  <b> Pajton interpreter </b>. Nakon instalacije, programe je iz terminala moguće pokrenuti komandom  <br> `python3 ime_fajla.py` </br> (ukoliko je instalirana verzija Pajtona koja je veća od 3, inače je dovoljna komanda `python ime_fajla.py`). 

### Ispis na standardni izlaz
Ispis na standardni izlaz vrši se komandom <b> `print(arg1, arg2, ..., argn)` </b>, pri čemu broj argumenata nije ograničen. Ukoliko želimo da ispišemo "Hello world" na standardni izlaz, to možemo uraditi pozivom 
`print("Hello world!")`. Analogno, ako želimo da ispišemo neki broj, to možemo uraditi na sledeći način
`print(3)` (za ispis celih projeva) ili
`print(2.5)`(za ispis realnih brojeva).

 Funkcija `print` može primiti i argumente različitog tipa: `pritn("Hello world!", 3, 2.5)`. U slučaju postojanja više argumenata, oni se podrazumevano ispisuju u istoj liniji, sa po jednim razmakom između svaka dva elementa. Ukoliko želimo da se između svaka dva elementa ispiše novi red kao separator umesto razmaka, to se može uraditi na sledeći način:
`print("Hello world!", 3, 2.5, sep = "\n")`, gde argument `sep` određuje koji karakter je separator prilikom ispisa. 

### Promenljive
Promenljive u Pajtonu se dosta razlikuju od promenljivih koje postoje u jezicima poput C-a i Jave. Za početak, <b> ne postoji naredba kojom se vrši deklaracija neke promenljive </b>, već se promenljiva kreira onog trenutka kada joj je dodeljena neka vrednost. To znači da se <b> tip promenljive</b> ne navodi unapred, već se određuje na osnovu vrednosti koja se čuva u njoj. Takođe, promenljive u Pajtonu mogu <b> menjati svoj tip u toku izvršavanja programa </b>. Dakle, moguće je kreirati promenljive na sledeći način:

>x = 5    # ova promenljiva će imati tip int
>y = "Hello world!"     # ova promenljiva će imati tip string
>x = "Variable changed type"   #promenljiva x je promenila tip i sada je tipa string
