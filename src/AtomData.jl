module AtomData

using Unitful, HalfIntegers
import Unitful: Wavenumber, Mass

include("types.jl")

const FS = Dict(
            "2S1/2" => FineStructure(0, 1/2, 1/2),
            "2P1/2" => FineStructure(1, 1/2, 1/2),
            "2P3/2" => FineStructure(1, 1/2, 3/2)
         )

export Li6
include("alkali.jl")

export I127
include("iodine.jl")

end
