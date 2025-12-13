try:
    n = int(input("Unesite broj n: "))
except ValueError:
    print("Greska! Neispravan ulaz!")
    exit(1)

lista = []
for i in range(n + 1):
    lista.append(i ** 2)

# {kljuc : vrednot}
# {"ime" : "Pera", "prezime" : "Peric", "indeks" : "mr23109"}

mapa = dict()

for i in  range(n + 1):
    mapa[i] = i * i

for k, v in mapa.items():
    print(k, ":", v)

