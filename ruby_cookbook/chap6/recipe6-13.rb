# Locking a file
# Problem:
# You want to prevent other threads or processes from modifying a file
# that you're working on.

def flock(file, mode)
  success = file.flock(mode)
  if success
    begin
      yield file
    ensure
      file.flock(File::LOCK_UN)
    end
  end
  return success
end

open('output', 'w') do |f|
  flock(f, File::LOCK_EX) do |f|
    f << "Kiss me, I've got a write lock on a file!"
  end
end

def open_lock(filename, openmode="r", lockmode=nil)
  if openmode == 'r' || openmode == 'rb'
    lockmode ||= File::LOCK_SH
  else
    lockmode ||= File::LOCK_EX
  end
  value = nil
  open(filename, openmode) do |f|
    flock(f, lockmode) do
      begin
        value = yield f
      ensure
        f.flock(File::LOCK_UN)
      end
    end
  end
end

t1 = Thread.new do
  puts 'Thread 1 is requesting a lock'
  open_lock('output', 'w') do |f|
    puts 'Thread 1 has acquired a lock.'
    f << "At last we're alone!"
    sleep(5)
  end
  puts 'Thread 1 has released its lock.'
end

t2 = Thread.new do
  puts 'Thread 2 is requesting a lock.'
  open_lock('output', 'r') do |f|
    puts 'Thread 2 has acquired a lock.'
    puts "File contents: #{f.read}"
  end
  puts 'Thread 2 has released its lock.'
end

t1.join
t2.join

# Nonblocking locks

def try_lock
  puts "I couldn't get a lock." unless 
    open_lock('contested', 'w', File::LOCK_EX | File::LOCK_NB) do
      puts "I've got a lock!"
      true
    end
end

##################################################
# NOTE:
# File::Lock_SH => Shared lock, more than one process can hold a shared lock
# for the file simultaneously
# File::LOCK_EX => Exclusive lock, only one process
# File::LOCK_UN => Unlock, this releases a lock that the process has on the file.
# File::LOCK_NB => Non-blocking, is already locked and the requested lock
# cannot be immediately acquired, the flock method return 'false'
##################################################
