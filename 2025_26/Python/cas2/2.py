x = 20

def kvadrat(x):
    print(x, id(x))
    x = x ** 2
    print(x, id(x))
    return x

print(x, id(x))
kvadrat(x)
print(x, id(x))

def izmeni_listu(l):
    print(l)
    l[0] = "0"
    print(l)

l = [1,2,3,4,5]
print(l, id(l))
izmeni_listu(l)
print(l, id(l))


