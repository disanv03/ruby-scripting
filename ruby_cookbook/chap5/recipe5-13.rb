# Remapping the keys and values of a hash
# Problem:
# You have two hashes with common keys but differing values. You want to create a new
# hash that maps the values of one hash to the values of another


class Hash
  def tied_with(hash)
    remap do |h,key,value|
      h[hash[key]] = value
    end.delete_if { |key,value| key.nil? || value.nil? }
  end

  def remap(hash={})
    each { |k,v| yield hash, k, v }
    hash
  end
end

p a = {1 => 2, 3 => 4 }
p b = {1 => 'foo', 3 => 'bar' }
p a.tied_with(b)
p b.tied_with(a)

##################################################
# NOTE:
# Use of 'remap':
# remap is called and iterates over each key-value pair in 'a'
# key is the key from 'a'
# value is the value from 'a'
# hash[key] gets the value from 'b' corresponding to the current
# 'key' from 'a'
##################################################
