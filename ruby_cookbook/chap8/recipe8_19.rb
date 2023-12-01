# Controlling Access by Making Methods Private
# Problem:
# You've refactored your code (or written it for the first time) and
# ended up a method that should be marked for internal use only.
# You want to prevent outside objects from calling such methods.

class SecretNumber
  def initialize
    @secret = rand(20)
  end
  def hint
    puts "The number is #{"not " if secret <= 10 }greater than 10."
  end

  private
  def secret
    @secret
  end
end

s = SecretNumber.new
#s.secret # NoMethodError
p s.hint

# Unlike many programming languages, a private method in Ruby is accessible
# to subclasses of the class that defines it:

class LessSecretNumber < SecretNumber
  def hint
    lower = secret-rand(10)-1
    upper = secret+rand(10)+1
    "The number is somewhere between #{lower} and #{upper}"
  end
end

ls = LessSecretNumber.new
puts ls.hint
puts ls.hint
puts ls.hint

class LessSecretNumber
  def compare(other)
    if secret == other.secret
      comparison = "equal to"
    else
      comparison = secret > other.secret ? "greater than" : "less than"
    end
    "This secret number is #{comparison} the secret number you passed in."
  end
end

a = LessSecretNumber.new
b = LessSecretNumber.new
a.hint
b.hint
#a.compare(b) # NoMethodError

class SecretNumber
  protected :secret
end

p a.compare(b)
p b.compare(a)

# You can trick a class into calling a private method from outside by 
# passing the methods symbol it #send or #funcall.
# You better have a really good reason for doing this.

p s.send(:secret)
