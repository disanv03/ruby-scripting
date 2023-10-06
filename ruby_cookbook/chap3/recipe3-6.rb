# Counting the Days since a Arbitrary Date
# Problem:
# You want to see how many days have elapsed since a particular date
# or how many ramain until a date in the future

def last_modified(file)
  t1 = File.stat(file).ctime
  t2 = Time.now
  elapsed = (t2-t1) / (60*60*24)
  puts "#{file} was last modified #{elapsed} days ago."
end

puts last_modified("/etc/passwd")
# puts last_modified("/home/your_usr_name")

# Using DateTime
# the result will be a rational number

require 'date'

def advent_calendar(date=DateTime.now)
  christmas = DateTime.new(date.year, 12, 25)
  christmas = DateTime.new(date.year+1, 12, 25) if date > christmas
  difference = (christmas-date).to_i
  if difference == 0
    puts "Today is Christmas"
  else
    puts "Only #{difference} day#{"s" unless difference==1} until Christmas."
  end
end

puts advent_calendar(DateTime.new(2006, 12, 24))
puts advent_calendar(DateTime.new(2006, 12, 25))
puts advent_calendar(DateTime.new(2006, 12, 26))

sent = DateTime.new(2006, 10, 4, 3, 15)
received = DateTime.new(2006, 10, 5, 16, 33)
elapsed = (received-sent) * 24
puts "You responded to my email #{elapsed.to_f} hours after I sent it."

def remaining(date, event)
  intervals = [["day", 1], ["hour", 24], ["minute", 60], ["second", 60]]
  elapsed = DateTime.now - date
  tense = elapsed > 0 ? "since" : "until"
  interval = 1.0
  parts = intervals.collect do |name, new_interval|
    interval /= new_interval
    number, elpased = elapsed.abs.divmod(interval)
    "#{number.to_i} #{name}#{"s" unless number == 1 }"
  end
  puts "#{parts.join("' ")} #{tense} #{event}."
end

puts remaining(DateTime.new(2006, 4, 15, 0, 0, 0, DateTime.now.offset), "the book deadline")
puts remaining(DateTime.new(1999, 4, 23, 8, 0, 0, DateTime.now.offset), "Math Final")

