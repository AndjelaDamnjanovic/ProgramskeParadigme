# and, or, not
# True, False

def radni_dan(dan):
    if dan % 7 == 1 or dan % 7 == 2:
        return True
    elif dan % 7 == 3 or dan % 7 == 4 or dan % 7 == 5:
        return True
    else:
        return False  

i = 0
while i < 10:
    dan = input("Unesite dan: ")
    try:
        dan = int(dan)
    except TypeError:
        print("Greska")
        exit(1)
    print(radni_dan(dan))
    i += 1
