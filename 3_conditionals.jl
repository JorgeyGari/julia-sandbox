x = 3;
y = 90;

if x > y
    println("$x is greater than $y")
elseif x < y
    println("$x is less than $y")
else
    println("$x is equal to $y")
end

#= Ternary operator
    condition ? if_true : if_false
=#
x > y ? println("$x is greater than $y") : println("$x is less than $y")

# Short-circuit evaluation with &&
x > y && println("$x is bigger than $y");  # Nothing prints because x > y is false!
x < y && println("$x is smaller than $y"); # Because x < y is true, Julia proceeds to evaluate the second operand.
