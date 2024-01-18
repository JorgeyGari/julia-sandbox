# My attempt at implementing the quicksort algorithm in Julia

function quicksort(array)
    len = length(array)
    len ≤ 1 && return array
    left = []
    right = []
    pivot = array[rand(1:len)]
    for item in array
        item < pivot ? push!(left, item) : push!(right, item)
    end
    return vcat(quicksort(left), quicksort(right))
end

array = [5, 2, 3, 0, 6, 1, 4];
quicksort(array)
