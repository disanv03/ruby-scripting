# Overloading Methods
# Problem:
# You want to create two different versions of a method with the same name:
# two methods that differ in the arguments they take.

# The rectangle constructor accepts arguments in either of the
# following forms:
# Rectangle.new([x_top, y_left], length, width)
# Rectangle.new([x_top, y_left], [x_bottom, y_right])

class Rectangle
  def initialize(*args)
    case args.size
    when 2
      @top_left, @bottom_right = args
    when 3
      @top_left, length, width = args
      @bottom_right = [@top_left[0] + length, @top_left[1] - width]
    else
      raise ArgumentError, "This method takes either 2 or 3 arguments."
    end
    # Perform additional type/erro checking on @top_left and
    # @bottom_right...
  end
end

Rectangle.new([10, 23], [14, 13])
Rectangle.new([10, 23], 4, 10)
# Rectangle.new # => ArgumentError...