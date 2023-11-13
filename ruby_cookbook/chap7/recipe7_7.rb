# Writing Block Methods that Classify or Collect
# Problem:
# The basic methods that come with ruby standard library aren't enough for you.
# You want to define your own method that classifies the elements in an enumeration
# (like Enumerable#detect and Enumerable#find_all), or that does a transformation on each
# element in an enumeration (like Enumerable#collect)

# With inject you can write your own versions of methods such as detect and find_all

module Enumerable
  def find_no_more_than(limit)
    inject([]) do |a, e|
      a << e if yield e
      return a if a.size >= limit
      a
    end
  end
end

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.find_no_more_than(3) { |x| x % 2 == 0 }

