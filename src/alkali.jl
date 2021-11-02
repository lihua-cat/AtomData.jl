function alkali_D1_D2(;M::Mass, gI::Real, I::Real, A::Vector{<:Wavenumber}, B::Vector{<:Wavenumber}, E::Vector{<:Wavenumber})
    length(A) == length(B) == length(E) == 3 || error("alkali_D1_D2!!")
    hfc = [HyperfineConstant(A[i], B[i]) for i in 1:3]
    ground  = FineLevel(FS["2S1/2"], hfc[1], E[1])
    excited = [FineLevel(FS["2P1/2"], hfc[2], E[2]), FineLevel(FS["2P3/2"], hfc[3], E[3])]
    Atom(M, gI, I, ground, excited)
end

A_Li6 = [5.1, 0.57993, -0.051702] / 1000 * u"cm^-1"
B_Li6 = [0, 0, -0.0033] / 1000 * u"cm^-1"
E_Li6 = [0, 14903.298, 14903.633] * u"cm^-1"
Li6 = alkali_D1_D2(M = 6.0151214u"u", gI = 0, I = 1, A = A_Li6, B = B_Li6, E = E_Li6)
