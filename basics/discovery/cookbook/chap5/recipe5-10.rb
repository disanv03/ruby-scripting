# Inverting a Hash
# Problem:
# Given a hash, you want to switch the keys and values. That is, you want to create a new hash whose keys are the values
# of the old hash, and whose value are the keys of the old hash.
# If the old hash mapped "human" to "wolf;" you want the new hash to map "wolf" to "human".


# The simplest technique is to use the Hash#invert method:

phone_directory = { 'alice' => '555-1212',
                    'bob' => '555-1313',
                    'mallory' => '111-1111' }
p phone_directory.invert

phone_directory = { 'alice' => '555-1212',
                    'bob' => '555-1313',
                    'carol' => '555-1313',
                    'mallory' => '111-1111',
                    'ted' => '555-1212' }

p phone_directory.invert

class Hash
  def safe_invert
    new_hash = {}
    self.each do |k,v|
      if v.is_a? Array
        v.each { |x| new_hash.add_or_append(x, k) }
      else
        new_hash.add_or_append(v, k)
      end
    end
    return new_hash
  end

  def add_or_append(key, value)
    if has_key?(key)
      self[key] = [value, self[key]].flatten
    else
      self[key] = value
    end
  end
end

p phone_directory.safe_invert
p phone_directory.safe_invert.safe_invert

##################################################
# NOTE:
# { |x| new_hash.add_or_append(x, k) } : For each element 'x':
# - It uses 'x' as a new key in 'new_hash'
# - 'k' which was the key for 'v' in the original hash, becomes the value 
# associated with 'x' in 'new_hash'
# - add_or_append(x,k): ensures that if 'x' is already a key in 'new_hash',
# 'k' will be added to the existing value in a non-destructive way (not overwriting it,
# but creating an array of values if not already present)
##################################################
