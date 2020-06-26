function MOI.empty!(model;kwargs...)
    model.inner_model = GetModel(model.method;kwargs...)
    model.variable_count = 0
    model.constraints = []
end


