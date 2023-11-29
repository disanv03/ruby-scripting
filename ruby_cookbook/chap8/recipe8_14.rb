# Creating an Abstract Method
# Problem:
# You wan to define a method of a class, but leave it for subclasses to
# fill in the actual implementations

class Shape2D
  def area
    raise NotImplementedError.new("#{self.class.name}#area is an abstract method.")
  end
end

#Shape2D.new.area

class Square < Shape2D
  def initialize(length)
    @length = length
  end
  def area
    @length ** 2
  end
end

p Square.new(10).area

class Shape2D
  def initialize
    raise NotImplementedError.new("#{self.class.name} is an abstract class.")
  end
end

#Shape2D.new

class Class
  def abstract(*args)
    args.each do |method_name|
      define_method(method_name) do |*args|
        if method_name == :initialize
          msg = "#{self.class.name} is an abstract class."
        else
          msg = "#{self.class.name}##{method_name} is an abstract method."
        end
        raise NotImplementedError.new(msg)
      end
    end
  end
end

class Animal
  abstract :initialize, :move
end

#Animal.new

class Sponge < Animal
  attr_reader :type
  def initialize
    @type = :Sponge
  end
end

sponge = Sponge.new
#sponge.move

class Cheetah < Animal
  def initialize
    @type = :Cheetah
  end
  
  def move
    "Running!"
  end
end

p Cheetah.new.move

class Sponge
  def move
    "Floating on ocean currents!"
  end
end
p sponge.move
p sponge.type
