# for loops
println("Let's count to 10.")
for i in 1:10
    println(i)
end

myfriends = ["Ted", "Robin", "Barney", "Lily", "Marshall"]
for friend in myfriends
    println("Hi, $friend" * "!")
end

for n ∈ -3:0 # ∈ is \in + Tab
    println(n)
end

for n ∈ -3:0, m ∈ 1:3
    println((n, m))
end

m, n = 5, 5
A = zeros(m, n)
for i ∈ 1:m, j ∈ 1:n    # Multiple indices in a single for-loop
    A[i, j] = i + j
end

B = [i + j for i ∈ 1:m, j ∈ 1:n]    # Array comprehension!
A == B

println("Behold! The growing matrix!")
for n ∈ 1:5
    local A = [i + j for i ∈ 1:n, j ∈ 1:n]  # Explicitly declare A as a local variable
    display(A)
end

# while loops (nothing new here)
i = 1
while i ≤ 10
    global i    # To avoid ambiguity, Julia requires the iteration variable to be explicitly declared as the global variable `i`
    println(i)
    i += 1
end
println("i = $i")

# A better way to do this is to create a local scope with `let`.
let i = 1
    while i ≤ 10
        println(i)
        i += 1
    end
    i
end
