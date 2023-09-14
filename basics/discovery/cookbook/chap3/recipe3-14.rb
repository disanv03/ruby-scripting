# Adding a Timeout to a long-Running Operation
# Problem:
# You're running some code that might take a long time to complete, or might never complete at all.
# You want to interrupt the code if it takes too long

# This code will sleep forever... OR WILL IT ?

require 'timeout'

before = Time.now

# timeout method takes a code block and a deadline (in seconds)
begin
  status= Timeout.timeout(5) { sleep }
rescue Timeout::Error
  puts "I only slept for #{Time.now-before} seconds."
end

def count_for_five_seconds
  $counter = 0
  begin
    Timeout::timeout(5) { loop { $counter += 1 } }
  rescue Timeout::Error
    puts "I can count to #{$counter} in 5 seconds."
    formatted_counter = $counter.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    puts "Human format: #{formatted_counter} in 5 seconds"
  end
end

count_for_five_seconds
sleep(5)
                        
