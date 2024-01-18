# Reading from a .txt file

input_file = open("my_phonebook.txt", "r")

phonebook = Dict{String,String}()

for line in eachline(input_file)
    name, number = split(line, "=")
    name = strip(name)
    number = strip(number)
    phonebook[name] = number
end
close(input_file)

println("Enter a name to look up:")
name = readline()
if haskey(phonebook, name)
    println("$(name)'s number is $(phonebook[name])")
else
    println("I don't know $(name)'s number.")
end

# Writing to a .txt file

output_file = open("my_phonebook_copy.txt", "w")

for (name, number) in phonebook
    println(output_file, "$(name) = $(number)")
end