def quicksort(array)
  if array.length < 2
    # base case, already "sorted" when array got 0 or 1 element
    array
  else
    # recursive case
    pivot = array[0]
    # sub-array of all the elements less than the pivot
    rest = array[1..-1]
    less = rest.select {|i| i <= pivot}
    greater = rest.select {|i| i > pivot}

    quicksort(less) + [pivot] + quicksort(greater)
  end
end

print quicksort([10, 5, 2, 3])

