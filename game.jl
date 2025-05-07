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
#                                       PLAYERS
#+========================================================================================+

"""
Defines a player for a differential game. 
"""
mutable struct Player
    """Dynamics of the player"""
    dynamics::Function

    """Objective function"""
    objective::Function

    """State dimension"""
    n::Int

    """Control dimension"""
    m::Int

    """General parameters for the player dynamics"""
    p::Any

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
function Player(dynamics, objective, n, m, p; lcons=[nothing], ucons=[nothing], sense=:min)
    return Player(dynamics, objective, n, m, p, lcons, ucons, sense)
end


#+========================================================================================+
#                                        GAME
#+========================================================================================+

"""
Defines a general differential game. 
"""
mutable struct DifferentialGame
    """A vector of players"""
    players::Vector{Player}

    """Initial conditions for each player"""
    X0::Vector

    """The time-span for the differential game"""
    tspan::Tuple

    """The type of solution that is desired"""
    sol_type::Symbol

    """Game state dimension"""
    n::Int

    """Game control dimension"""
    m::Int
end


"""
Defines a differential game
"""
function DifferentialGame(players, X0, tspan; sol_type=:nash)
    # Determine the state and control dimensions 
    n, m = 0, 0
    for player ∈ players
        n = n + player.n
        m = m + player.m 
    end

    return DifferentialGame(players, X0, tspan, sol_type, n, m)
end




