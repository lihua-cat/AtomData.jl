"""
    FineStructure(L, S, J)

Fine structure angular momentum quantum number.

quantum number notation
- `L` electron orbital quantum number
- `S` electron spin quantum number
- `J` L + S, total quantum number of fine structure
- `I` nuclear spin quantum number
- `F` J + I, total quantum number of hyperfine sturcture 
"""
struct FineStructure
    L::Int
    S::HalfInt
    J::HalfInt
end

"""
    HyperfineConstant(A, B)

Hyperfine interaction constants.

- `A::Wavenumber{<:Real}`   magnetic dipole constant
- `B::Wavenumber{<:Real}`   electric quadrupole constant
"""
struct HyperfineConstant
    A::Wavenumber{<:Real}   # magnetic dipole constant
    B::Wavenumber{<:Real}   # electric quadrupole constant
end

"Fine structure energy level"
struct FineLevel     
    state::FineStructure
    hfc::HyperfineConstant
    E::Wavenumber        
end

"""
Atom
- `M::Mass`                         relative atomic mass, default in unit `u`
- `gI::Float64`                     nuclear Lande g-factor
- `I::HalfInt`                      nuclear spin quantum number, either an integer or a half-integer
- `ground::FineLevel`               only one ground state (fine stucture)
- `excited::Vector{FineLevel}`      several excited states (fine stucture)
"""
struct Atom
    M::Mass                         # relative atomic mass, default in unit `u`
    gI::Float64                     # nuclear Lande g-factor
    I::HalfInt                      # nuclear spin quantum number, either an integer or a half-integer
    ground::FineLevel               # only one ground state (fine stucture)
    excited::Vector{FineLevel}      # several excited states (fine stucture)
end