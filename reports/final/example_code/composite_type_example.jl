mutable struct OrthoMADS{T,F} <: AbstractPoll
    l::F
    Δᵖmin::T
    t₀::F
    t::F
    tmax::F
    OrthoMADS(N::Int) = OrthoMADS{Float64,Int64}(N)
    function OrthoMADS{T,F}(N::F) where T,F
        M = new()
        #Initialise as the Nth prime
        M.tmax = M.t = M.t₀ = prime(N)
        M.l = 0
        M.Δᵖmin = 1.0
        return M
    end
end
