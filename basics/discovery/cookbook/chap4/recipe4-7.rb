# Making sure a sorted array stays sorted
# Problem:
# You want to make sure an array stays sorted, even as you replace its elements or add new elements to it.

class SortedArray < Array

  # In ruby & when using as a method parameters, relates to the concept of blocks, procs, and lambdas.
  # Here '&sort_by' captures any block passed and converts it to a Proc object.
  # If no block is given, 'sort_by' will be 'nil'.
  # Ex: sorted_array = SortedArray.neww { |a, b| b <=> a }
  # In this case the block '{ |a, b| b <=> a } is captured by &sort_by
  # The line 'sort! &sort_by
  # '&sort_by' is converting the Proc object back to a block which is passed to sort! method
  # In essence, the & symbol in this context serves as a bridge between blocks and procs,
  # allowing dynamic sorting behaviors to be passed to the 'SortedArray' class upon initialization
  #
  def initialize(*args, &sort_by)
    @sort_by = sort_by || Proc.new { |x,y| x <=> y }
    super(*args)
    sort! &sort_by
  end

  def insert(i, v)
    # The return value '1' from the @sort_by proc indicates that x is > than v
    # so v should be inserted before x
    insert_before = index(find { |x| @sort_by.call(x, v) == 1 })
    # If insert_before not nil, it inserts v at that index, otherwise it insert v at index -1 which appends v
    # to the end of the array.
    super(insert_before ? insert_before : -1, v)
  end

  # The shovel operator, conventionally used in Ruby to append an element.
  # However, in this custom class, the << operator call the previously insert method to insert v at its 
  # appropriate position.
  def <<(v)
    insert(0, v)
  end

  # Alias keyword for creating another name for a method
  # Now both push and unshift will have the same behavior as the newly defined << method in this custom class.
  alias push <<
  alias unshift <<

  # Redefining methods using the power of metaprogramming
  ["collect!", "flatten!", "[]="].each do |method_name|
    # The 'module_eval' method is used to evaluate the provided string within the context of the
    # current module or class. It allows for dynamic method definition.
    module_eval %{
      def #{method_name} (*args)
        super
        sort! &@sort_by
      end
    }
  end

  def reverse!
    # Do nothing; reversing the array would disorder it
  end
end

a = SortedArray.new([3,2,1])
puts a

unsorted = ["b", "aa", "a", "cccc", "1", "zzzzz", "k", "z"]
strings_by_alpha = SortedArray.new(unsorted)
puts strings_by_alpha
strings_by_length = SortedArray.new(unsorted) do |x, y|
  x.length <=> y.length
end
puts strings_by_length

puts a << -1
puts a << 1.5
puts a.push(2.5)
puts a.unshift(1.6)

# For methods like collect! and array assignment ([]=) that allow complex changes to an array, the simplest
# solution is to allow the changes to go through and then re-sort

puts "##################################################" 
a = SortedArray.new([10, 6, 4, -4, 200, 100])
puts a
puts a.collect! { |x| x * -1 }
a[3] = 25
puts a
# That is, -6 has been replaced by 25 and the array has been re-sorted

# Here we tell Ruby to replace the elements at indices 1 and 2 with the new array
a[1..2] = [6000, 10, 600, 6]
puts a
# That is, -100 and -10 have been replaced by 6000, 10, 600, and 6 and the
# array has been re-sorted


