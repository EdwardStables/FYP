using GLPK
using JuMP

p = Model(GLPK.Optimizer)

@variable(p, x)
@variable(p, y)

@objective(p, Max, 2x + 7y)

@constraint(p, -5 ≤ x ≤ 2)
@constraint(p, y ≤ 30)
@constraint(p, 2x + 8y ≥ 3)

optimize!(p)
@show value(x) # = 2.0
@show value(y) # = 30.0

