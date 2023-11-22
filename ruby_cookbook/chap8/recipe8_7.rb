# Defining a virtual Attribute
# Problem:
# You want to create accessor methods for an attribute that isn't directly
# backed by any instance variable: it's a calculated value derived from one
# or more different instance variable

# The following class exposes four accessor methods: degrees, degrees=, radians
# and radians=. But it only stores one instance variable: @radians.

class Arc
  attr_accessor :radians

  def degrees
    @radians * 180 / Math::PI
  end

  def degrees=(degrees)
    @radians = degrees * Math::PI / 180
  end

end

arc = Arc.new
arc.degrees = 180
p arc.radians
p arc.radians = Math::PI / 2
