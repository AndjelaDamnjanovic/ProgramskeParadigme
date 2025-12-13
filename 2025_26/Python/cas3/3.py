imena = ["Marko", "Petar", "Pavle"]
ocene = []

for ime in imena:
    ocena = int(input("Unesite ocenu za " + ime))
    ocene.append(ocena)

print(list(zip(imena, ocene)))



