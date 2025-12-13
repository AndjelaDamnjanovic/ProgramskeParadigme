try:
    intervali = input("Unesite intervale: ")
    lista = intervali.split(" ")
    lista = [int(el) for el in lista]
    print(lista)

except ValueError:
    print("Greska!")
    exit(1)

def parovi(a, b, c, d):
    lista = []

    for i in range(a, b + 1):
        for j in range(c, d + 1):
            lista.append((i, j))
    return lista

def parovi2(a, b, c, d):
    # list comprehension
    # [el domen elementa]
    return [(x, y) for y in range(c, d + 1) for x in range(a, b + 1)]


