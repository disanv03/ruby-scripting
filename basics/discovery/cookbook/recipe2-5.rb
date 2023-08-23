# Generating Random Numbers

# Kernel#rand

puts rand
puts rand

puts rand(5)
puts rand(5)
puts rand(1000)

# Selecting random item from an array
a = ['item1', 'item2', 'item3']
puts a[rand(a.size)]

m = { :key1 => 'value1',
      :key2 => 'value2',
      :key3 => 'value3' }
values = m.values
puts values[rand(values.size)]

def random_word
  letters = { 'v' => 'aeiou',
              'c' => 'bcdfghjklmnprstvwyz' }
  word = ''

  'cvcvcvc'.each_char do |x|
    source = letters[x]
    word << source[rand(source.length)]
  end
  word
end

10.times do
puts random_word
end
