import constraint

problem = constraint.Problem()
problem.addVariables("TF", range(1, 10))
problem.addVariables("WOUR", range(0, 10))

def o(t, w, o, f, u, r):
    return 2 * (t * 100 + w * 10 + o) == 1000 * f + 100 * o + 10 * u + r

problem.addConstraint(constraint.AllDifferentConstraint())
problem.addConstraint(o, "TWOFUR")

solutions = problem.getSolutions()

for solution in solutions:
    print(" ", solution['T'], solution['W'], solution['O'])
    print("+", solution['T'], solution['W'], solution['O'])
    print("------")
    print(solution['F'], solution['O'], solution['U'], solution['R'])
    print("##############")
