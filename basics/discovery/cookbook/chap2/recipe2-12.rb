# Using Complex Numbers
# Problem:
# You want to represent complex ("imaginary") numbers and perform math on them

require 'complex'

Complex::I

a = Complex(1,4)
puts a.real
puts a.imag

b = Complex(1.5, 4.25)
puts b + 1.5
puts b + 1.5 * Complex::I
puts a - b
puts a * b
# Conjugate go to the opposite direction of the imaginary number
puts b.conjugate

# Mandelbrot Set

class Mandelbrot

  def initialize(bailout=10, iterations=100)
    @bailout, @iterations = bailout, iterations
  end

  def mandelbrot(x,y)
    c = Complex(x,y)
    z = 0
    @iterations.times do |i|
      z = z**2 + c # This is the Mandelbrot operation
      return false if z.abs > @bailout
    end
    return true
  end

  def render(x_size=80, y_size=24, inside_set="*", outside_set=" ")
    0.upto(y_size) do |y|
      0.upto(x_size) do |x|
        scaled_x = -2 + (3 * x / x_size.to_f)
        scaled_y = 1 + (-2 * y / y_size.to_f)
        print mandelbrot(scaled_x, scaled_y) ? inside_set : outside_set
      end
      puts
    end
  end
end

Mandelbrot.new.render(25,10)
      
