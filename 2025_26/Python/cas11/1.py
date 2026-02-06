import constraint
# from constraint import Problem
# problem = Problem() 
problem = constraint.Problem()
niska = "B C D E"
problem.addVariable('A', range(1, 10))
problem.addVariables(niska.split(' '), range(0, 10))

problem.addConstraint(constraint.AllDifferentConstraint())

solutions = problem.getSolutions()

# A + 2 * B - 3 * C + 4 * D - 5 * E
solution = solutions[0]

minimum = solution['A'] + 2 * solution['B'] - 3 * solution['C'] + 4 * solution['D'] - 5 * solution['E']
res = solution['A'] * 10000 + solution['B'] * 1000 + solution['C'] * 100 + solution['D'] * 10 + solution['E']

for solution in solutions:
    if solution['A'] + 2 * solution['B'] - 3 * solution['C'] + 4 * solution['D'] - 5 * solution['E'] < minimum:
        minimum = solution['A'] + 2 * solution['B'] - 3 * solution['C'] + 4 * solution['D'] - 5 * solution['E']
        res = solution['A'] * 10000 + solution['B'] * 1000 + solution['C'] * 100 + solution['D'] * 10 + solution['E']

print(res)


