# This file demonstrates how to get input from the user

println("Hello! What is your name?")
name = readline()
println("Hello, ", name, "!")
println("Let's play a game! Try to guess my favorite number from 1 to 10.")

let guess = 0, fav_number = rand(1:10)
    while guess ≠ fav_number
        println("Enter your guess: ")
        try
            guess = parse(Int, readline())
        catch
            println("Please enter an integer.")
            continue
        end
        if guess < fav_number
            println("Too low!")
        elseif guess > fav_number
            println("Too high!")
        else
            println("You got it!")
        end
    end
end
