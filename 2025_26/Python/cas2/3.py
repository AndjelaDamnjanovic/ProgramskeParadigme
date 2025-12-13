def printf(*args):
    print(args)

def printf2(**kwargs):
    print(kwargs)

def proizvod(x = 1, *args):
    tmp = x
    for el in args:
        tmp *= el

    return tmp

print(proizvod())
print(proizvod(1))
print(proizvod(1,2,3,4))
