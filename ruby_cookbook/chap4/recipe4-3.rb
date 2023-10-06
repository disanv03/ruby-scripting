# Stripping Duplicate Elements from an array
# Problem:
# You want to strip all duplicate elements from an array, or prevent duplicate elements from being
# added in the first place

survey_results = [1, 2, 7, 1, 1, 5, 2, 5, 1]
distinct_answers = survey_results.uniq
survey_results.uniq!
puts survey_results

# To ensure that duplicate values never get into your list use a set instead of an array.

require 'set'

survey_results = [1, 2, 7, 1, 1, 5, 2, 5, 1]
distinct_answers = survey_results.to_set

puts distinct_answers

games = [["Alice", "Bob"], ["Carol", "Ted"], ["Alice", "Mallory"], ["Ted", "Bob"]]
players = games.inject(Set.new) { |set, game| game.each { |p| set << p }; set }
puts players

players << "Ted"
puts players

# Strip instances of particular value
# Array#delete for this task, Array#compact for the special case of removing nil values

a = [1, 2, nil, 3, 3, nil, nil, nil, 5]
puts a.compact
puts a.delete(3)
puts "#########"
puts a
