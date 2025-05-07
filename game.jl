"""
Author(s): Bennet Outland
Orgainization(s): CU Boulder, AFRL
Information Control: None - University Product
License: MIT
"""

# Imports
# NONE

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
TODO: figure out how to best express this. Especillay express min or max
"""
function O_E(t)
    return t
end

"""
TODO
"""
function O_P(x_E, x_P, p)
    return norm(x_E .- x_P)
end


#+========================================================================================+
#                                       STRUCTS
#+========================================================================================+

"""
Defines a player for a differential game. 
"""
mutable struct Player
    """Dynamics of the player"""
    dynamics::Function

    """Objective function"""
    objective::Function

    """Lower control bound"""
    lcons::Vector

    """Upper control bound"""
    ucons::Vector

    """Optimization form. Either :min or :max"""
    sense::Symbol
end

"""
Defines a player. TODO: add warnings
"""
function Player(dynamics, objective; lcons=[nothing], ucons=[nothing], sense=:min)
    return Player(dynamics, objective, lcons, ucons, sense)
end


evader = Player(f_E, O_E, lcons=[-1.0, 1.0], ucons=[-1.0, 1.0], sense=:max)
pursuer = Player(f_P, O_P, lcons=[-0.1], ucons=[0.1])


# TODO:
# - Define the Game
# - Determine a way to simulate the game
# - Test by putting some values in
# - Start writing the solver






# mutable struct Player{T}
#     """Dynamics of the player"""
#     dynamics::Function

#     """Objective function"""
#     objective::Function

#     """Dimension of the state"""
#     n::Int64

#     """Dimension of the control"""
#     m::Int64

#     """Initial condition"""
#     x::Vector{T}

#     """Simulation time"""
#     t::Float64
# end

# evader = Player{Float64}(f_E, O_E, 2, 2, [5.0, 5.0], 0.0)
# pursuer = Player{Float64}(f_P, O_P, 3, 1, [0.0, 0.0], 0.0)



# struct DifferentialGame


#     """Dynamics of the players"""
#     dynamics

# end


