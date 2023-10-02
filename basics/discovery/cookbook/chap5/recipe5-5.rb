# Using an array or other modifiable object as a hash key
# Problem:
# You want to use a modifiable built-in object (an array or a hash, but not a string)
# as key in a hash, even while you modify the object in place.

coordinates = [10, 5]
treasure_map = { coordinates => 'jewels' }
p treasure_map[coordinates]

# add a z-coordinate

coordinates << -5
p coordinates
p treasure_map[coordinates] # => nil

# The easiest solution is to call the hash#rehash method every time you modify one of the
# hash's keys.

treasure_map.rehash
p treasure_map[coordinates]

module ReliablyHashable
  def hash
    return object_id
  end

  class ReliablyHashableArray < Array
    include ReliablyHashable
  end
end

# It's now possible to keep track of the jewels:
coordinates = ReliablyHashable::ReliablyHashableArray.new([10,5])
treasure_map = { coordinates => 'jewels' }
p treasure_map[coordinates]

coordinates.push(-5)
p treasure_map[coordinates]

a = [1,2]
b = a.clone
p a.hash
p b.hash

a = ReliablyHashable::ReliablyHashableArray.new([1,2])
b = a.clone
p a.hash
p b.hash
