# double quotes for scans for special substitution codes.
number = 5
"The number is #{number}."
"The number is #{5}."
"The number after #{number} is #{number.next}."
"The number prior to #{number} is #{number-1}."
"We're ##{number}!"


# Showing the power of the interpolation feature.
%{Here is #{class InstantClass
   def bar
      "some text"
    end
 end
 InstantClass.new.bar
}.}
# => "Here is some text."

"I've set x to #{x = 5; x += 1}."
x # => 6

# to avoid trigerring string interpolation escape the hash or put single quotes
"\#{foo}" # => "\#{foo}"
'#{foo}'  # => "\#{foo}"

ex = <<END
  Here you can write anything
  END



