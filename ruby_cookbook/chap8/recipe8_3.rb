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
