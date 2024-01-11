# My attempt at implementing the quicksort algorithm in Julia

function quicksort(array)
    # Choose a pivot:
    len = length(array)
    if len ≤ 1
        return array
    end
    left = []
    right = []
    pivot = array[rand(1:len)]
    for item in array
        item < pivot ? push!(left, item) : push!(right, item)
    end
    return vcat(quicksort(left), quicksort(right))
end

array = [5, 2, 3, 0, 6, 1, 4]
quicksort(array)
