# Keeping Multiple values for the same Hash Key
# Problem:
# You want to build a hash that migth have duplicate values for some keys

hash = Hash.new { |hash, key| hash[key] = [] }
raw_data = [ [1, 'a'], [1, 'b'], [1, 'c'],
             [2, 'a'], [2, ['b', 'c']],
             [3, 'c'] ]
raw_data.each { |x, y| hash[x] << y }
p hash

# A hash maps any given key to only one value, but that value can be
# an array. This is a common phenomenon when reading data structures
# from the outside world.

class MultiValuedHash < Hash
  def []=(key, value)
    if has_key?(key)
      super(key, [value, self[key]].flatten) # self[key] eq to the old_value
    else
      super
    end
  end
end

##################################################
#NOTE:
# When a new-value pair is inserted ([]= method), it
# checks if the key already exists in the hash
# If the key already exists, it takes the new value
# and the existing value(s), puts them into an array, and
# flatten it, effectively creating or extending an array of values for that key.
# If the key does not exist, it behaves like a regular hash,
# simply assigning the new key-value pair
##################################################

hash = MultiValuedHash.new

hash[:key1] = 'a'
hash[:key2] = 'b'

hash[:key1] = 'c'
hash[:key1] = 'd'
p hash
