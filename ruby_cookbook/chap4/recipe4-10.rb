# Shuffling an Array
# Problem:
# You want to put the elements of an array in random order

# In ruby when calling rand without args it returns
# a floating-point number between 0 (inclusive) and 1 (exlusive)
p [1, 2, 3].sort_by { rand }

class Array
  def shuffle!
    each_index do |i|
      j = rand(length-i) + i
      self[j], self[i] = self[i], self[j]
    end
  end
end

def shuffle
  dup.shuffle!
end

##################################################
# NOTE:
# each_index method iterates over index of the
# array, rather than its elements.
# 
# Logic behind j = rand(length-i) + i
# suppose array of length 5 (arr.length = 5)
# When i = 0, random j anywhere from 0 to 4, the
# expression become rand(5-0) so (5) exclusive.
#
# Adding i offsets these values, untouching the 
# previous change.
# 
# P.S: no need for self.length as this is an 
# instance method.
# 
##################################################

class Card
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@suit} of #{@rank}"
  end
end

class Deck < Array
  attr_reader :cards
  @@suits = %w{Spades Hearts Clubs Diamonds}
  @@ranks = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}

  def initialize
    @@suits.each { |suit| @@ranks.each { |rank| self << Card.new(rank, suit) } }
  end
end

deck = Deck.new
p deck.collect { |card| card.to_s }
deck.shuffle!
p deck.collect { |card| card.to_s }
