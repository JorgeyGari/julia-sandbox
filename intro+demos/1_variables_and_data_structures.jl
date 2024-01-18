a = 3;  # Semicolon suppresses output
b = 2   # You can see the output by pressing Ctrl+Enter (VSCode)
c = a + 4;
b * c;

typeof(a)

# Unicode support
β = 1.2;    # Greek letters are allowed and can be typed by pressing Tab (\beta + Tab)
2β  # No need to type * for multiplication with numbers

function area_of_circle(radius)
    r² = radius^2
    return 2π * r²  # Here, * is required for multiplication because π is a variable and so is r²
end;
# π is a built-in constant

area_of_circle(3)

# Notation is very convenient for mathematical functions
f(x) = x^2 + 2x + 1;
f(3)

# Multivariate functions
g(x, y) = x^2 + 2x + y^2 + 2y + 1;
g(3, 4)

# A piecewise function
sign(x) = begin
    if x < 0
        return -1
    elseif x == 0
        return 0
    else
        return 1
    end
end;
sign(3)
sign(-3)
sign(0)

gf = f ∘ g  # Function composition (\circ + Tab)
gf(3, 4)

✔️ = sign ∘ gf
✔️(3, 4)

# Printing
println("Hello, world!")

#=
    This is a multiline comment.
=#

# Strings
string1 = "I am a string."
string2 = """I am also a string."""

string_with_quotes = "I am a \"string\".";
println(string_with_quotes)

# Inserting variables into strings with $
name = "John"
age = 20
println("My name is $name and I am $age years old.")

# String concatenation
string1 * " " * string2
string(string1, string2)
"$string1 $string2"

# Data structures
# Dictionaries

myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")
myphonebook["Jenny"]

myphonebook["Kramer"] = "555-FILK"
myphonebook

pop!(myphonebook, "Kramer") # pop! removes the key-value pair from the dictionary
myphonebook

# Tuples
mytuple = (1, 2, 3)
mytuple[1]  # Indexing starts from 1

# Arrays
myfriends = ["Ted", "Robin", "Barney", "Lily", "Marshall"]
fibonacci = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
mixed = [1, "a", 2, "b", 3, "c"]

myfriends[3]
myfriends[3] = "Baby Bop"
myfriends

push!(fibonacci, 89)  # push! adds an element to the end of the array
pop!(fibonacci)  # pop! removes the last element of the array

#=
    In Julia, ! is used by convention to denote functions that modify their arguments.
    push! and pop! are examples of such functions.
=#

numbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
rand(3, 3)  # 3x3 array of random numbers
rand(3, 3, 3)  # 3x3x3 array of random numbers
