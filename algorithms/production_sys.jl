#= Production System

    Implementing a production system in Julia, based on the one described
    as an example on the Wikipedia page for production systems.
        (https://en.wikipedia.org/wiki/Production_system_(computer_science))

=#

#= Production Rules

        The production rules are defined as follows:
            P1: %% → *
            P2: *% → *
            P3: *x → x*
            P4: * → null & halt
            P5: %xy → y%x
            P6: null → *%

        A boolean variable, halt, is used to indicate when the production
        system should stop. The halt variable is set to true when the
        production system applies rule P4.

        A function can_apply_Pi(string) is defined for each rule Pi. This
        function returns true if the rule can be applied to the string,
        and false otherwise.

=#

# P1: %% → *
function can_apply_P1(string)
    for i in 1:length(string)-1
        if string[i] == '%' && string[i+1] == '%'
            return true
        end
    end
    return false
end

function apply_P1!(string)
    for i in 1:length(string)-1
        if string[i] == '%' && string[i+1] == '%'
            string = string[1:i-1] * "*" * string[i+2:end]
            return string
        end
    end
    return string
end

# P2: *% → *
function can_apply_P2(string)
    for i in 1:length(string)-1
        if string[i] == '*' && string[i+1] == '%'
            return true
        end
    end
    return false
end

function apply_P2!(string)
    for i in 1:length(string)-1
        if string[i] == '*' && string[i+1] == '%'
            string = string[1:i] * string[i+2:end]
        end
    end
    return string
end

# P3: *x → x*
function can_apply_P3(string)
    for i in 1:length(string)-1
        if string[i] == '*' && isletter(string[i+1])
            return true
        end
    end
    return false
end

function apply_P3!(string)
    for i in 1:length(string)-1
        if string[i] == '*' && isletter(string[i+1])
            string = string[1:i-1] * string[i+1] * "*" * string[i+2:end]
            return string
        end
    end
    return string
end

# P4: * → null & halt
global halt = false
function can_apply_P4(string)
    for c in string
        if c == '*'
            return true
        end
    end
    return false
end

function apply_P4!(string)
    for c in string
        if c == '*'
            string = replace(string, c => "")
            global halt = true
            return string
        end
    end
    return string
end

# P5: %xy → y%x
function can_apply_P5(string)
    for i in 1:length(string)-2
        if string[i] == '%' && isletter(string[i+1]) && isletter(string[i+2])
            return true
        end
    end
    return false
end

function apply_P5!(string)
    for i in 1:length(string)-2
        if string[i] == '%' && isletter(string[i+1]) && isletter(string[i+2])
            string = string[1:i-1] * string[i+2] * "%" * string[i+1] * string[i+3:end]
            return string
        end
    end
    return string
end

# P6: null → *%
function apply_P6!(string)
    string = "%" * string
    return string
end


#=  Conflict Resolution Strategy

    The conflict resolution strategy is to apply the first rule that
    matches the string. The rules are applied in the order they are
    defined above.

=#

function apply_rules!(string)
    rule = ""
    while !halt
        if can_apply_P1(string)
            rule = "P1"
            string = apply_P1!(string)
        elseif can_apply_P2(string)
            rule = "P2"
            string = apply_P2!(string)
        elseif can_apply_P3(string)
            rule = "P3"
            string = apply_P3!(string)
        elseif can_apply_P4(string)
            rule = "P4"
            string = apply_P4!(string)
        elseif can_apply_P5(string)
            rule = "P5"
            string = apply_P5!(string)
        else
            rule = "P6"
            string = apply_P6!(string)
        end
        println("$string\t\t($rule)")
    end
    return string
end

function main()
    println("Enter a string to be transformed:")
    string = readline()
    string = apply_rules!(string)
    println("The transformed string is: $string")
end

main()
