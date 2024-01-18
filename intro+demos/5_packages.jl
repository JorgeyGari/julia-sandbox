# To see all available packages: https://juliahub.com/ui/Packages

using Pkg   # Pkg is a standard library

Pkg.add("Example")  # Add a package called "Example"
using Example  # Use the package "Example"
hello("world")  # Call the function "hello" in the package "Example"

Pkg.add("Colors")
using Colors
palette = distinguishable_colors(100)  # Generate 100 distinguishable colors
rand(palette, 3, 3)  # Pick 9 colors randomly from the palette
colorant"red"  # Create a colorant called "red"
