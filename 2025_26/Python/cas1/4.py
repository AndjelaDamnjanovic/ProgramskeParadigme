lista = [1, 2.3, "string", [1,2,3]]
print(lista)

bafer = []
i = 0

while True:
    el = input("Unesite element: ")
    bafer.append(el)


    if el == "quit":
        break

    i += 1

    if i == 5:
        print(bafer)
        i = 0