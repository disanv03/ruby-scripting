# Checking Class or Module Membership
# Problem:
# You want to see if an object is of the right type for your purposes

def send_as_package(obj)
  if obj.respond_to? :package
    packaged = obj.package
  else
    $strerr.puts "Not sure how to package a #{obj.class}."
    $strerr.puts 'Trying generic packager'
    package = Package.new(obj)
  end
  send(package)
end

def multiply_precisely(a,b)
  if a.is_a? Float or b.is_a? Float
    raise ArgumentError, "I can't do precise multiplication with floats."
  end
  a * b
end

multiply_precisely(4, 5)
# multiply_precisely(4.0, 5)

def append_to_self(x)
  unless x.respond_to? :<<
    raise ArgumentError, "This object doesn't support the left-shift operator"
  end
  if x.is_a? Numeric
    raise ArgumentError, "The left-shift operator for this object doesn't do an append."
  end
  x << x
end

append_to_self('abc')
append_to_self([1, 2, 3])
p append_to_self({1 => 2}) # => ArgumentError: This object doesn't support the left-shift operator
# append_to_self(5) # => ArgumentError: The left-shift operator for this object doesn't do an append
p 5 << 5

# Alternative solution approximates the functionality of Java's interfaces.
module ShiftMeansAppend
  def <<(x)
  end
end

class String
  include ShiftMeansAppend
end

class Array
  include ShiftMeansAppend
end

def append_to_self(x)
  unless x.is_a? ShiftMeansAppend
    raise ArgumentError, "I can't trust this object's left-shift operator"
  end
  x << x
end

# append_to_self 4 #=> ArgumentError: I can't trust this object's left-shigt operator
p append_to_self '4'