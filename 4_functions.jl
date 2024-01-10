function sayhi(name::String)
    println("Hi $name.")
end
sayhi("Julia")

sayhi2(name::String) = println("Hi $name.")
sayhi2("Julia")

# Anonymous functions
sayhi3 = name -> println("Hi $name.")
sayhi3("Julia")

#= 
    One can think of anonymous functions as maps.
    `sayhi3` maps name to `println("Hi $name.")`
=#

#= Duck-typing
    Julia does not care about the type of the argument
    as long as it has the required methods.

    "If it quacks like a duck, it is a duck."
=#

function f(x)
    x^2
end

A = rand(3, 3);

f(2)
f(2.0)
f("2")
f(A)

# Mutating functions vs. non-mutating functions
v = [5, 1, 3, 2, 4]
v[1]
sort(v)
v[1] # v is not mutated
sort!(v)
v[1] # v is mutated

#= Broadcasting
    Broadcasting is a way of applying a function to each element of an array.
    Broadcasting is denoted by a dot `.`.
=#
A = [i + 3j for i ∈ 1:3, j ∈ 1:3]
A .+ 1
f(A)    # A²
f.(A)   # a_ij² ∀ i, j
