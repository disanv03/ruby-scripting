# Running a code Block Periodically
# Problem:
# You want to run some Ruby code (such as a call to a shell command) repeatedly at a certain interval

#def every_n_seconds(n)
#  loop do
#    before = Time.now
#    yield
#    interval = n-(Time.now-before)
#    sleep(interval) if interval > 0
#  end
#end

#every_n_seconds(5) do
#  puts "At the beep, the time will be #{Time.now.strftime("%X")}...beep!"
#end


def every_n_seconds(n)
  thread = Thread.new do
    while true
      before = Time.now
      yield
      interval = n-(Time.now-before)
      sleep(interval) if interval > 0
    end
  end
  thread.join
end

def monitor_changes(file, resolution=5)
  last_change = Time.now
  every_n_seconds(resolution) do
    check = File.stat(file).mtime
    if check > last_change
      # yield file
      puts "#{file} was modified"
      last_change = check
    elsif Time.now - last_change > 60
      puts "Nothing's happened for a minute, I'm bored."
      break
    end
  end
end

monitor_changes("./myfile.txt") 
