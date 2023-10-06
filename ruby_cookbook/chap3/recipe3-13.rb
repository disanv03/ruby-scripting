# Waiting a Certain Amount of Time
# Problem:
# You want to pause your program, or a single thread of it, for a specific amount of time


3.downto(1) { |i| puts "#{i}..."; sleep(1) }; puts "Go!"

# puts Time.new
# sleep(10)
# puts Time.new
# sleep(1)
# puts Time.new
# puts Time.new.usec
# sleep(0.1)
# puts Time.new.usec

interval = 1.0
10.times do |x|
  t1 = Time.new
  sleep(interval)
  actual = Time.new - t1

  difference = (actual-interval).abs
  percent_difference = difference / interval * 100
  # %% = literal percent character in a format string for printf
  printf("Expected: %.9f Actual: %.6f Difference: %.6f (%.2f%%)\n",
         interval, actual, difference, percent_difference)
  # Reduce the sleep interval by a factor of 10 for the next iteration
  interval /= 10
end

# alarm = Thread.new { sleep(5); Thread.main.wakeup }
# puts "Going to sleep for 1000 seconds at #{Time.new}..."
# sleep(1000); puts "Woke up at #{Time.new}!"


alarm = Thread.new { sleep(5); Thread.main.wakeup }
puts "Goodbye, cruel world!"
Thread.stop
puts "I'm back; how'd that happen?"
