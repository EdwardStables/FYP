function b_l_generation(b::Dict{T,Vector{T}}, i::Dict{T,Int}, l::T, N::Int
                       ) where T
    if !haskey(b, l)
        i[l] = rand(1:N)
        b[l] = [rand(-2^l+1:2^l-1) for _=1:N]
        b[l][i[l]] = rand([-1, 1]) * 2^l
    end
    return b[l], i[l]
end

x = []

for _ = 1:N
	push!(x, rand(-2^l+1:2^l-1))
end
