from functools import reduce

n = int(input())

#reduce (BINARNA fja, kolekcija) => vrednost

print(reduce(lambda x, y: x + y, list(range(n + 1))))
