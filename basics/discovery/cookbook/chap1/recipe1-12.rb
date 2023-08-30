# Testing whether an object is string-like

puts 'A string'.respond_to? :to_str
puts Exception.new.respond_to? :to_str
puts 4.respond_to? :to_str

def join_to_successor(s)
  raise ArgumentError, 'No succesor method!' unless s.respond_to? :succ
  "#{s}#{s.succ}"
end

puts join_to_successor('a')
puts join_to_successor(4)
join_to_successor(4.01)
