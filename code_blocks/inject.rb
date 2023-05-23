################################
# Inject Methods
################################
# Accumulator
# Block variable to use for accumulation
# Ruby convention: memo

array = (1..5).map {|n| n } # => [1,2,3,4,5]
array.inject {|memo, n| memo + n } # => 15

fruits = ['apple', 'banana', 'pear', 'orange']
longest = fruits.inject do |memo, fruit|
    if fruit.length > memo.length
        fruit
    else
        memo
    end
end # => 'banana'
