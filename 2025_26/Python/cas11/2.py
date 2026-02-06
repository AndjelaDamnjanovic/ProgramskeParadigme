import constraint

problem = constraint.Problem()

problem.addVariable('A', range(1, 51))
problem.addVariable('B', range(1, 26))
problem.addVariable('C', range(1, 11))
problem.addVariable('D', range(1, 6))
problem.addVariable('E', range(1,3))

def ogranicenje(a, b, c, d, e):
    return a + 2 * b + 5 * c + 10 * d + 20 * e == 50

problem.addConstraint(ogranicenje, "ABCDE")

solutions = problem.getSolutions()

for solution in solutions:
    print("1 *", solution['A'], " + 2 * ", solution['B'], "+ 5 * ", solution['C'], " + 10 * ", solution['D'], " + 20 * ", solution['E'])
    
