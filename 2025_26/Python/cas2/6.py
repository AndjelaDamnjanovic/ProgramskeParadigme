try: 
    n = int(input("Unesite br elemenata: "))
except ValeuError:
    print("Niste unei ceo broj!")
    exit(1)

lista = []
j = 0
index = 0

for i in range(n):
    br = int(input())
    if br not in lista:
        lista.append(br)
        if len(lista) <= 1:
            j += 1
            continue
        if lista[j] < lista[j - 1]:
            index = j
        j += 1

lista = lista[index:] + lista[:index]

print(lista)




