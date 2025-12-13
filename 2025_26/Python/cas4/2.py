import json


try:
    with open("korpa.json", "r") as f:
        korpa = json.load(f)
    with open("maxi_cene.json", "r") as f:
        maxi_cene = json.load(f)
    with open("idea_cene.json", "r") as f:
        idea_cene = json.load(f)
    with open("shopngo_cene.json", "r") as f:
        shopngo_cene = json.load(f)
except IOError:
    print("Greska prilikom otvaranja fajlova")
    exit(1)

def vrati_cenu_voca(prodavnica, ime):
    for proizvod in prodavnica:
        if proizvod["ime"] == ime:
            return proizvod["cena"]

maxi = sum([voce["kolicina"] * vrati_cenu_voca(maxi_cene, voce["ime"]) for voce in korpa])
idea = sum([voce["kolicina"] * vrati_cenu_voca(idea_cene, voce["ime"]) for voce in korpa])
shopngo = sum([voce["kolicina"] * vrati_cenu_voca(shopngo_cene, voce["ime"]) for voce in korpa])

print("Maxi " + str(maxi) + " dinara")
print("Idea " + str(idea) + " dinara")
print("Shopngo " + str(round(shopngo, 2)) + " dinara")
