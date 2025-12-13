niska = input("Unesite nisku: ")
# map(unarna fja, kolekacija)
# ako je potrebno ISTU fju primeniti na SVAKI el kolekcije
lista = list(map(lambda c: c.upper(), niska))

print(''.join(lista))
