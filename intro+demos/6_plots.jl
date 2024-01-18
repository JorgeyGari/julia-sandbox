Pkg.add("Plots")
using Plots
x = -3:0.1:3    # Create an array of numbers from -3 to 3 in steps of 0.1
f(x) = x^2

y = f.(x)

gr()    # Use the GR backend for Plots.jl
plot(x, y, label="line")        # Plot a line
scatter!(x, y, label="points")  # Modify the previous plot by adding points

# We can also use the PlotlyJS backend
Pkg.add("PlotlyJS")
plotlyjs()
plot(x, y, label="line")
scatter!(x, y, label="points")
# The plot is now interactive!

globaltemperatures = [14.4, 14.5, 14.8, 15.2, 15.5, 15.8];
numpirates = [45000, 20000, 15000, 5000, 400, 17];

plot(numpirates, globaltemperatures, legend=false)
scatter!(numpirates, globaltemperatures, legend=false)
xflip!()    # Flip the x-axis
xlabel!("Number of Pirates [Approximate]")
ylabel!("Global Temperature (ºC)")
title!("Influence of pirate population on global warming")

# Subplots
p1 = plot(x, x)
p2 = plot(x, x .^ 2)
p3 = plot(x, x .^ 3)
p4 = plot(x, x .^ 4)
plot(p1, p2, p3, p4, layout=(2, 2), legend=false)
