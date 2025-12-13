import json

ime = input("Unesite ime: ")
prezime = input("Unesite prezime: ")
godine = int(input("Unesite godine: "))

junak = {"ime" : ime, "prezime" : prezime, "godine": godine}

print(json.dumps(junak))

with open("junak.json", "w") as f:
    json.dump(junak, f)

with open("junak.json", "r") as f:
    rez = json.load(f)
    print(rez)