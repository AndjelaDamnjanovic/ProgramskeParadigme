import constraint

problem = constraint.Problem()

problem.addVariable('X', range(1, 91))
problem.addVariable('Y', [2 * i for i in range(1, 31)]) 
problem.addVariable('Z', [i * 10 for i in range(0, 11)])

def o1(x, z):
    return x >= z 

def o2(x, y, z):
    return 2 * x + x * y + z <= 34

problem.addConstraint(o1, "XZ")
problem.addConstraint(o2, "XYZ")

solutions = problem.getSolutions()

for solution in solutions:
    print("X = ", solution['X'], ", Y = ", solution['Y'], " Z = ", solution['Z'])