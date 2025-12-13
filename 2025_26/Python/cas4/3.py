import json
from sys import argv
from functools import cmp_to_key

if len(argv) != 3:
    print("Nedovoljno argumenata")
    exit(1)

nacionalnost = argv[1]
datoteka = argv[2]

try:
    with open(datoteka, "r") as f:
        fudbaleri = json.load(f)
except IOError:
    print("Greska prilikom otvaranja fajla")
    exit(1)

filtrirano = filter(lambda x: x["Nacionalnost"] == nacionalnost, fudbaleri)

def uporedi(x, y):
    if x["Golovi"] < y["Golovi"]:
        return -1
    elif x["Golovi"] > y["Golovi"]:
        return 1
    else:
        return 0

rez = sorted(filtrirano, key = lambda x : x["Golovi"])
