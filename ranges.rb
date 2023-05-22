# inclusive
inclusive = 1..10 # number to start with and number to end with

# exclusive
exclusive = 1...10

array = [*exclusive]

alpha = 'a'..'z'

array_alpha = [*alpha]


# other way
range = 1...10
array = range.to_a # Output: [1, 2, 3, 4, 5, 6, 7, 8, 9]


another_array = []
for num in range
    another_array << num
end

puts another_array.inspect # Output: [1, 2, 3, 4, 5, 6, 7, 8, 9]