# AtomData.jl

AtomData.jl is a julia package contains useful reference data for some of the alkali atoms (and iodine atoms), including basic physical parameters (atomic mass, fine structure energy level data...) and hyperfine interaction constants (magnetic dipole constant A and electric quadrupole constant B).

## Atom list
- alkali atoms:
  - [x] Lithium 6
  - [ ] Potassium 39
  - [ ] ...  
- iodine atoms:
  - [x] Iodine 127
  - [ ] Iodine 129

## Struct and Function
atom data is stored in `Atom` struct
```julia
struct Atom
    M::Mass                         # relative atomic mass, default in unit `u`
    gI::Float64                     # nuclear Lande g-factor
    I::HalfInt                      # nuclear spin quantum number, either an integer or a half-integer
    ground::FineLevel               # only one ground state (fine stucture)
    excited::Vector{FineLevel}      # several excited states (fine stucture)
end

struct FineLevel     
    state::FineStructure
    hfc::HyperfineConstant
    E::Wavenumber        
end

struct FineStructure
    L::Int
    S::HalfInt
    J::HalfInt
end

struct HyperfineConstant
    A::Wavenumber{<:Real}   # magnetic dipole constant
    B::Wavenumber{<:Real}   # electric quadrupole constant
end
```
example: iodine 127
```julia
using AtomData

function print_struct(x)
    println(summary(x))
    for p in propertynames(x)
        println("  $p: $(getproperty(x, p))")
    end
end

atom = I127

print_struct(atom)
print_struct(atom.ground)
print_struct(atom.excited[1])
```
```julia
Atom
  M: 126.9 u
  gI: 1.1232
  I: 5/2
  ground: AtomData.FineLevel(AtomData.FineStructure(1, 1/2, 3/2), AtomData.HyperfineConstant(0.02759 cm^-1, 0.038119999999999994 cm^-1), 0.0 cm^-1)
  excited: AtomData.FineLevel[AtomData.FineLevel(AtomData.FineStructure(1, 1/2, 1/2), AtomData.HyperfineConstant(0.21972999999999998 cm^-1, 0.0 cm^-1), 7602.9768 cm^-1)]
```
```julia
AtomData.FineLevel
  state: AtomData.FineStructure(1, 1/2, 3/2)
  hfc: AtomData.HyperfineConstant(0.02759 cm^-1, 0.038119999999999994 cm^-1)
  E: 0.0 cm^-1
```
```julia
AtomData.FineLevel
  state: AtomData.FineStructure(1, 1/2, 1/2)
  hfc: AtomData.HyperfineConstant(0.21972999999999998 cm^-1, 0.0 cm^-1)
  E: 7602.9768 cm^-1
```


## Reference
for alkali atoms, see https://steck.us/alkalidata/
