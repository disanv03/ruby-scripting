# Processing a String One Word at a Time

class String
  def word_count
    frequencies = Hash.new(0)
    downcase.scan(/\w+/) { |word| frequencies[word] += 1 }
    return frequencies
  end
end

puts %{"I have no shame," I said.}.word_count

