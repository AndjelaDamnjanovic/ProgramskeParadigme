import constraint

problem = constraint.Problem()

def o(x, y, z):
    return x + y + z == 15

problem.addVariables("ABCDEFGHI", range(1, 10))
problem.addConstraint(constraint.AllDifferentConstraint())
problem.addConstraint(o, "ABC")
problem.addConstraint(o, "DEF")
problem.addConstraint(o, "GHI")
problem.addConstraint(o, "ADG")
problem.addConstraint(o, "BEH")
problem.addConstraint(o, "CFI")
problem.addConstraint(o, "AEI")
problem.addConstraint(o, "CEG")

solutions = problem.getSolutions()
"""
A B C
D E F
G H I
"""
for solution in solutions:
    print(solution['A'], " ", solution['B'], " ", solution['C'])
    print(solution['D'], " ", solution['E'], " ", solution['F'])
    print(solution['G'], " ", solution['H'], " ", solution['I'])
    print("---------")

