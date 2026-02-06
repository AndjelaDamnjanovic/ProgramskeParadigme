import constraint

problem = constraint.Problem()

problem.addVariable('K', range(0, 28))
problem.addVariable('S', range(0, 41))

def o1(k, s):
    return k * 1.5 + s * 1 <= 40

def o2(k, s):
    return k * 100 + s * 120 <= 5000

problem.addConstraint(o1, "KS")
problem.addConstraint(o2, "KS")

solutions = problem.getSolutions()

solution = solutions[0]
maksimum = 1000 * solution['S'] + 1500 * solution['K']
res = solution

for solution in solutions:
    zarada = 1000 * solution['S'] + 1500 * solution['K']
    if zarada > maksimum:
        maksimum = zarada
        res = solution

print(res)