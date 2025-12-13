lista_str = input("Unesite listu: ")

lista = lista_str.split(" ")

els = []
for el in lista:
    els.append(int(el))

print(els)
print(sum(els))
print(max(els))
print(els.count(1))
print(len(els))