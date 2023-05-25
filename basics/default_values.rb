!#/usr/bin/env ruby

def welcome(greeting, name, punct)
  greeting + ' ' + name + punct
end

puts welcome('hello', 'friend', '!')

def welcome(greeting, name, punct='!')
  greeting + ' ' + name + punct
end

puts welcome('hello', 'friend')

def welcome(greeting, name='friend', punct='!')
  greeting + ' ' + name + punct
end

puts welcome('hello')

# to skip in between argument (here name)
def welcome(greeting, options={})
  name = options[:name] || 'friend'
  punct = options[:punct] || '!'
  greeting + ' ' + name + punct
end

puts welcome('hello', {:punct => '!!!'})
