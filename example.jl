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