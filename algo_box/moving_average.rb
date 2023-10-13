# Sliding Window technique
# Problem:
# Given a window_size (here 3) which "slides" into the array,
# you want to calculate the average of the 3 numbers 
# selected by the moving window. (slide by 1 from left to right for next iteration)


def moving_average(arr, window_size)
    sum = arr[0...window_size].sum
    averages = [sum / window_size.to_f]

    (window_size...arr.size).each do |i|
        sum = sum - arr[i - window_size] + arr[i]
        averages << sum / window_size.to_f
    end
    averages
end

puts moving_average([1, 2, 3, 4, 5, 6], 3).inspect

# This approach does not recalculate the entire sum for each window position.
# It updates the sum by only considering the exiting and entering elements,
# namely the leftmost arr[i - window_size] and the rightmost arr[i] elements.