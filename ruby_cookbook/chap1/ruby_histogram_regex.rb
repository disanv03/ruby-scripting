# Processing a String One Word at a Time

class String
  def word_count
    frequencies = Hash.new(0)
    
    # implicitly called on the instance is being invoked on
    # self is the default receiver within instance methods
    downcase.scan(/\w+/) { |word| frequencies[word] += 1 }
    return frequencies
  end
end

puts %{"I have no shame," I said.}.word_count

# like /\w+/, but doesn't consider underscore part of a word
# [] define a character class
/[0-9A-Za-z]/

# + for one or more times
# * for zero or more occurences

# Accpet dashes and apostrophes as parts of words
/[-'\w]+/

# matching english words
/(\w+(['-.]\w+)*)/

# () alow grouping and capturing.
