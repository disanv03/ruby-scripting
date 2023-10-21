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
