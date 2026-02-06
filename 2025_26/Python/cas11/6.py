# GREEN + ORANGE = COLORS

import constraint

problem = constraint.Problem()

problem.addVariables("GOC", range(1, 10))
problem.addVariables("RENALS", range(0, 10))

def o(G, O, C, R, E, N, A, L, S):
    return 10000*G + 1000 * R + 100 * E + 10 * E + N +\
            100000 * O + 10000 * R + 1000 * A + 100 * N + 10 * G + E ==\
            100000 * C + 10000 * O + 1000 * L + 100 * O + 10 * R + S 

problem.addConstraint(constraint.AllDifferentConstraint())
problem.addConstraint(o, "GOCRENALS")

solutions = problem.getSolutions()

for solution in solutions:
    print(solution['G'], solution['R'], solution['E'], solution['E'], solution['N'], " + ",
    solution['O'], solution['R'], solution['A'], solution['N'], solution['G'], solution['E'], " = ",
    solution['C'], solution['O'], solution['L'], solution['O'], solution['R'], solution['S']
    )
