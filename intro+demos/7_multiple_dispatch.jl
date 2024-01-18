methods(+)
# There are many methods for the + function, depending on the type of the arguments

@which 1 + 1        # which method is called for 1 + 1?
@which 1.0 + 1      # which method is called for 1.0 + 1?
@which 1.0 + 1.0    # which method is called for 1.0 + 1.0?

# Extending the + function
import Base: +    # Bring the + function into scope so we can extend it
+(x::String, y::String) = string(x, y)    # Concatenate strings
"Hello " + "World!"    # Call the new + function
@which "Hello " + "World!"    # which method is called for "Hello " + "World!"? The one we just defined!

foo(x, y) = println("duck-typed foo! $x $y")
foo(x::Int, y::Float64) = println("foo with an integer and a float! $x $y")
foo(x::Float64, y::Float64) = println("foo with two floats! $x $y")
foo(x::Int, y::Int) = println("foo with two integers! $x $y")
foo(1, 1)
foo(1.0, 1.0)
foo(1, 1.0)
foo("Hello", "World!")