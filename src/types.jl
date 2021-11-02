"""
quantum number notation
- `L` electron orbital quantum number
- `S` electron spin quantum number
- `J` L + S, total quantum number of fine structure
- `I` nuclear spin quantum number
- `F` J + I, total quantum number of hyperfine sturcture 
"""
abstract type QuantumState end

struct FineStructure <: QuantumState
    L::Int
    S::HalfInt
    J::HalfInt
    function FineStructure(L, S, J)
        if all((L, S, J) .>= 0)
            if J in abs(L-S):abs(L+S)
                new(L, S, J)
            else
                error("L, S, J not match: $L, $S, $J")
            end
        else
            error("L: $L, S: $S, J: $J must be non-negative!!")
        end
    end
end

"""
HyperfineConstant
- `A::Wavenumber{<:Real}`   magnetic dipole constant
- `B::Wavenumber{<:Real}`   electric quadrupole constant
"""
struct HyperfineConstant
    A::Wavenumber{<:Real}   # magnetic dipole constant
    B::Wavenumber{<:Real}   # electric quadrupole constant
end

abstract type EnergyLevel end

struct FineLevel <: EnergyLevel
    state::FineStructure
    hfc::HyperfineConstant
    E::Wavenumber   # energy level
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