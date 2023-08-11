# Changing the case of a string

s = 'HELLO, I am not here. I WENT to tHe MaRKEt.'

puts s.upcase
puts s.downcase
puts s.swapcase
puts s.capitalize

class String

  def capitalize_first_letter
    self[0].chr.capitalize + self[1, size]
    # self[1, size] fetches the remaining part of the string, starting from the second
    # ch up to the end
  end

  # this method modifies the original string and capitalizes its
  def capitalize_first_letter!
    unless self[0] == (c = self[0,1].upcase[0])
      self[0] = c
      self
    end
  end
end


