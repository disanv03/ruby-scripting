# Converting and Coercing Objects to Different types
# Problem:
# You have an object of one type and you want tu use it as though it were of another type

p "4".to_i
p 4.to_s
p Time.now.to_f
hash = { "key1" => "value1", "key2" => "value2" }.to_a
p hash

