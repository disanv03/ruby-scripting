# finds the smallest value in an array
def find_smallest(arr)
  # store the smallest value
  smallest = arr[0]
  smallest_index = 0
  
  (1...(arr.length)).each do |i|
    if arr[i] < smallest
      smallest = arr[i]
      smallest_index = i
    end
  end
  smallest_index
end

# sort array
def selection_sort(arr)
  new_arr = []
  arr.length.times do
    # finds the smallest element in the array and adds it to the new array
    smallest = find_smallest(arr)
    new_arr.push(arr.delete_at(smallest))
  end
  new_arr
end

p selection_sort([5,3,6,2,10])

