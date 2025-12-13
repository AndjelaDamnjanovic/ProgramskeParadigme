def aritm_sredina(*args):
    suma = 0
    br = 0
    for el in args:
        br += 1
        suma += el

    return suma / br

def aritm_sredina2(*args):id(x)
    return sum(args) / len(args)

print(aritm_sredina2(1,2,3,4,5))