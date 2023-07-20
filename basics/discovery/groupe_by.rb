# group_by

news = [
  { title: 'News 1', date: Date.new(2023, 7, 1) },
  { title: 'News 2', date: Date.new(2023, 7, 2) },
  { title: 'News 3', date: Date.new(2023, 6, 20) },
  { title: 'News 4', date: Date.new(2023, 6, 22) },
  { title: 'News 5', date: Date.new(2023, 5, 15) },
  { title: 'News 6', date: Date.new(2023, 5, 10) },
]

# Each key is a return value from the block.
# Each value is an array of those elements for which the block returned that key.
grouped_news = news.group_by { |item| item[:date].strftime('%B %Y') }

sorted_news = grouped_news.sort.reverse.to_h


students = [
  { name: 'John', grade: 'A' },
  { name: 'Sarah', grade: 'B' },
  { name: 'Bob', grade: 'A' },
  { name: 'Alice', grade: 'C' },
  { name: 'Charlie', grade: 'B' },
]

grouped_students = students.group_by { |student| student[:grade] }

grouped_students.each do |grade, students|
  puts "Grade #{grade}:"
  students.each do |student|
    puts "- #{student[:name]}"
  end
end
