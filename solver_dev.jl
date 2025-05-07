"""
Author(s): Bennet Outland
Orgainization(s): CU Boulder, AFRL
Information Control: None - University Product
License: MIT
"""

# Includes
include("game.jl")

# Usings
using LinearAlgebra


#+========================================================================================+
#                                         DYNAMICS
#+========================================================================================+

"""
Dynamics of the evader. 
- x ∈ ℝ^2
- u ∈ ℝ^2
"""
function f_E(x, u, p, t)
    return u
end

"""
Dynamics of the pursuer parameterized by the constant velocity.
- x ∈ ℝ^3
- u ∈ ℝ
- p ∈ ℝ
"""
function f_P(x, u, p, t)
    return [p * cos(x[3]), p * sin(x[3]), u]
end


#+========================================================================================+
#                                       OBJECTIVES
#+========================================================================================+

"""
evader observation
"""
function O_E(Y, u, p, t)
    return t
end

"""
pursuer observation
"""
function O_P(Y, u, p, t)
    x_E = Y[1]
    x_P = Y[2]
    return norm(x_E .- x_P)
end


#+========================================================================================+
#                                       GAME DEF
#+========================================================================================+

# Basic test
evader = Player(f_E, O_E, 2, 2, nothing, lcons=[-1.0, 1.0], ucons=[-1.0, 1.0], sense=:max)
pursuer = Player(f_P, O_P, 3, 1, 2.0, lcons=[-0.1], ucons=[0.1])
game = DifferentialGame([evader, pursuer], [[3.0, 3.0], [0.0, 0.0, 0.0]], (0.0, 1.0))



#+========================================================================================+
#                                       SOLVER
#+========================================================================================+

# Get it into the cannonical form TODO

"""
Define the dynamics in the "stacked" dynamical format
"""
function dynamics_stacked(game, x, u, p, t)

    return 42
end

x_test = zeros(5)
u_test = ones(3)
