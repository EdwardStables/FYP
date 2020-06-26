"""
    BumpIterationLimit(p::DSProblem, val::Int=100)

Increase the iteration limit by `i`.
"""
function BumpIterationLimit(p::DSProblem; i::Int=100)
    p.iteration_limit += i
end


help?> BumpIterationLimit
search: BumpIterationLimit

  BumpIterationLimit(p::DSProblem, val::Int=100)


  Increase the iteration limit by i.

julia>

