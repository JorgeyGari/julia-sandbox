A = rand(1:4, 3, 3) # 3x3 matrix with random integers from 1 to 4
B = A               # B is a reference to A
C = copy(A)         # C is a copy of A

[B C] # horizontal concatenation
A[1] = 17
[B C] # B is changed because it is a reference to A, but C is still the same

#=
    When we declare `B = A`, we are basically creating a pointer.
    B and A point to the same object in memory, so when we change A, B changes as well.
    On the other hand, when we declare `C = copy(A)`, we are creating a new object in memory
    with the same value as A, and assigning C to point to that new object.
=#


x = ones(3)
b = A * x

# Create a complex matrix
D = rand(1:4, 3, 3) + im * rand(1:4, 3, 3)    # im is the Julia notation for the imaginary unit i
D'              # conjugate transpose
transpose(D)    # transpose
D' == transpose(D)

Asym = A + A'   # symmetric matrix

# Solve a linear system
A \ b

#= Overdetermined systems
    When A is tall, the \ operator computes a least-squares solution.
=#

Atall = A[:, 1:2] # make a tall matrix by slicing A
display(Atall)
Atall \ b

#=
    Underdetermined systems
    When A is short, the \ operator computes a minimum norm solution.
=#

Ashort = A[1:2, :] # make a short matrix by slicing A
display(Ashort)
Ashort \ b[1:2]
