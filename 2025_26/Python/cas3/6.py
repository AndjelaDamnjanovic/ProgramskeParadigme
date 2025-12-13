# 1. nacin

f = open("niska.txt", "r")
niska = f.read()
f.close()

f = open("slova.txt", "w")
# filter(UNARNA BULOVSKA fja, kolekcija)
rez = list(filter(lambda c: not c.isalpha(), niska))
for el in rez:
    f.write(el)

f.close()
list(map(lambda c: c.upper(), niska))