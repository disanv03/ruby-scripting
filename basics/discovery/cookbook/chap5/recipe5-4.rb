# Removing Elements from a Hash
# Problem:
# Certain elements of your hash got to go!

h = {}
h[1] = 10
p h
# Passing the key to Hash#delete
h.delete(1)
p h

h = {}
p h[5]
h[5] = 10
p h[5]
h[5] = nil
p h[5]
p h.keys
h.delete(5)
p h.keys


# The follwing code deletes all key-value pairs with a certain value

class Hash
  def delete_value(value)
    delete_if { |k,v| v == value }
  end
end

h = {'apple' => 'green', 'potato' => 'red', 'sun' => 'yellow', 'katydid' => 'green'}
h.delete_value('green')
p h

class Hash
  def remove_hash(other_hash)
    delete_if { |k,v| other_hash[k] == v }
  end
end

squares = { 1 => 1, 2 => 4, 3 => 9 }
doubles = { 1 => 2, 2 => 4, 3 => 6 }
squares.remove_hash(doubles)
p squares

h = {}
1.upto(1000) { |x| h[x] = x }
p h.keys.size
h.clear
p h
