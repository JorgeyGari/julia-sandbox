# My attempt at implementing the mergesort algorithm in Julia

function mergesort(array)
    len = length(array)
    if len ≤ 1
        return array
    end
    middle = len ÷ 2
    left = array[begin:middle]
    right = array[middle+1:end]
    left = mergesort(left)
    right = mergesort(right)
    if left[end] ≤ right[begin]
        return append!(left, right)
    end
    return merge_arr!(left, right)
end

function merge_arr!(left, right)
    merged = []
    while length(left) > 0 && length(right) > 0
        if left[begin] ≤ right[begin]
            push!(merged, popfirst!(left))
        else
            push!(merged, popfirst!(right))
        end
    end
    if length(left) > 0
        return append!(merged, left)
    end
    if length(right) > 0
        return append!(merged, right)
    end
end

array = [5, 2, 3, 0, 6, 1, 4];
mergesort(array)
