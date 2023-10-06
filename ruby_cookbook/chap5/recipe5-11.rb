# Choosing Randomly from a Weighted List
# Problem:
# You want to pick a random element from a collection, where each element in the colection
# has a different probablility of being chosen.

def choose_weighted(weighted)
  sum = weighted.inject(0) do |sum, item_and_weight|
    sum += item_and_weight[1]
  end
  target = rand(sum)
  weighted.each do |item, weight|
    return item if target <= weight
    target -= weight
  end
end

marbles = { :black => 51, :white => 17 }
3.times { puts choose_weighted(marbles) }

##################################################
#NOTE:
# Substracting the weight as you progress through the items
# effectively "moves" your random target through the combined
# range of weights until it "lands" within the range of a specific
# item. This process provide a way to ensure that the probabilities of
# selecting each item are proportional to their individual weights
#
# marbles = { :black => 51, :white => 17 }
# # => sum = 68
# Range assignement:
# - :black 0...51
# - :white 51...68
# If you get a random target say "35" it falls into the :black range.
# If the target is "60" it falls into :white range
#
# Let's analyze the "consumption" part:
# first item :black with a weight of 51
# target <= weight if our target was "35" :black is chose and the iteration stop
# target > weight, you subtract the weight from the target and move to the next item.
# This effectivly moves the target number through the number line of ranges.
# Suppose the target was "60"
# target - weight => "50 - 51" => "9"
# on second iteration :white, the target 9 <= 17 so :white is selected
# 
# The consumption of the ranges (subtracting weights) is vital to move the target
# number through the continuum of ranges until it falls within a specific item's range, thereby
# selecting it.
##################################################

lottery_probabilities = { "You've wasted your money" => 1000,
                          "You've won back the cost of your ticket !" => 50,
                          "You've won two shiny zorkmids !" => 20,
                          "You've won five zorkmids !" => 10,
                          "You've won ten zorkmids !" => 5,
                          "You've won a hundred zorkmids !" => 1 }

5.times { puts choose_weighted(lottery_probabilities) }
