# Looping Through Multiple iterables in parallel
# Problem:
# You want to traverse multiple iteration methods simultaneously,
# probably to match up the corresponding elements in several different arrays

# The SyncEnumerator class, defined in the generator library, makes it easy to iterate
# over a bunch of arrays or other Enumerable objects in parallel.

require 'enumerator'

arrays = [%w{Four seven}, %w{score years}, %w{and ago}]

enumerator = Enumerator.new do |yielder|
  arrays.first.length.times do |i|
    yielder.yield arrays.map { |array| array[i] }
  end
end.lazy

enumerator.each do |row|
  row.each { |word| puts word}
  puts '---'
end

def interosculate(*enumerables)
  enumerators = enumerables.collect do |enum|
    Enumerator.new do |yielder|
      enum.each { |e| yielder << e }
    end
  end
  done = false
  until done
    # Assume this is the last loop, unless we find a generator below.
    done = true
    enumerators.each do |enumerator|
      begin
        yield enumerator.peek
        enumerator.next
        # Since we have found a new generator we set done to false
        done = false
      rescue StopIteration
        # Skip to the next enumerator if the current one is exhausted
      end
    end
  end
end

interosculate(%w{Four and}, %w{score seven years ago}) do |x|
  puts x
end

l = ["junk1", 1, "junk2", 2, "junk3", "junk4", 3, "junk5"]

e = Enumerator.new do |yielder|
  l.each { |element| yielder << element }
end
p e.next # => 'junk1'
p e.next # => 1
p e.next # => 'junk2'

# It's not difficult to write an iterator method that skips the junk.
def l.my_iterator
  each { |e| yield e unless e.to_s.start_with?("junk") }
end

l.my_iterator { |x| puts x }

enumerator = Enumerator.new do |yielder|
  l.each do |element|
    yielder << element unless element.to_s.start_with?("junk")
  end
end

puts enumerator.next
puts enumerator.next
puts enumerator.next

enumerator = Enumerator.new { |y| l.my_iterator { |e| y << e } }

def interosculate(*iterables)
  enumerators = iterables.collect do |x|
    if x.is_a? Method
      Enumerator.new { |y| x.call { |e| y << e } }
    else
      x.to_enum
    end
  end
  # Flag to track if all Enumerators are exhausted
  done = false
  until done
    done = true
    enumerators.each do |enumerator|
      begin
        yield enumerator.next
        done = false
      rescue StopIteration
        # If an Enumerator is exhausted
      end
    end
  end
end

words1 = %w{Four and years}
words2 = %w{ago seven score}
interosculate(words1, words2.method(:reverse_each)) { |x| puts x }