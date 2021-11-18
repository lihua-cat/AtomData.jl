function iodine(;M::Mass, gI::Real, I::Real, A::Vector{<:Wavenumber}, B::Vector{<:Wavenumber}, E::Vector{<:Wavenumber})
    length(A) == length(B) == length(E) == 2 || error("iodine!!")
    hfc = [HyperfineConstant(A[i], B[i]) for i in 1:2]
    ground  = FineLevel(FS["2P3/2"], hfc[1], E[1])
    excited = [FineLevel(FS["2P1/2"], hfc[2], E[2])]
    Atom(M, gI, I, ground, excited)
end

A_I127 = [27.59, 219.73] / 1000 * u"cm^-1"
B_I127 = [38.12, 0] / 1000 * u"cm^-1"
E_I127 = [0, 7602.9768] * u"cm^-1"
I127 = iodine(M = 126.9u"u", gI = 1.1232, I = 5//2, A = A_I127, B = B_I127, E = E_I127)