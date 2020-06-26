p = DSProblem(2)
SetObjective(p, SomeFunctionHandle)
SetInitialPoint(p, [1.0, 3.5])
SetIterationLimit(p, 1000)


p = DSProblem(2, poll=OrthoMADS(2), 
              objective = SomeFunctionHandle,
              initial_point=[1.0, 3.5], 
              iteration_limit=1000)


AddExtremeConstraint(p, x[1] -> x[1]>0)
AddProgressiveConstraint(p, x[1] -> -x[1])


