# Converting Between degrees and Radians

class Numeric
  def degrees
    self * Math::PI / 180
  end
end

90.degrees
Math::tan(45.degrees)
Math::cos(90.degrees)
Math::sin(90.degrees)
Math::sin(89.9.degrees)
Math::sin(45.degrees)
Math::cos(45.degrees)

