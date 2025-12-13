import json
from sys import argv

if len(argv) != 3:
    print("Nedovoljno argumenata")
    exit(1)

try:
    with open("menjacnica.json", "r") as f:
        menjacnica = json.load(f)
except IOError:
    print("Neuspesno otvorena datoteka")
    exit(1)

valuta = argv[1]
iznos = int(argv[2])

kursevi = menjacnica["rates"]
print(kursevi[valuta] * iznos)