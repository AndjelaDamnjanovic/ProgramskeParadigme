print("Hello world!", 1, 2, 3, 4)

a = input("Unesi ceo broj: ")
b = input("Unesi drugi broj: ")
print(a + b)
print(a - b, a // b, a * b)
try:
    # a = int(a)
    # b = int(b)
    print(a + b, a - b, a // b, a * b)
except TypeError:
    print("Niste uneli ceo broj!")
    exit(1)


