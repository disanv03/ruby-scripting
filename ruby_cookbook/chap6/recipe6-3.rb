# Changing the permissions on a File
# Problem:
# You want to control access to a file by modifying its Unix premissions.
# For instance, you want to make it so that everyone on your system can read a file,
# but only you can write to it.

class File
  U_R = 0400
  U_W = 0200
  U_X = 0100
  G_R = 0040
  G_W = 0020
  G_X = 0010
  O_R = 0004
  O_W = 0002
  O_X = 0001

  # All at once
  A_R = 0444
  A_W = 0222
  A_X = 0111
end

open("my_file", "w") {}
File.chmod(File::U_R | File::U_W | File::G_R | File::O_R, "my_file")
File.chmod(File::A_R | File::U_W, "my_file")
File.chmod(0644, "my_file")
# File.chmod(File::A_X, "my_file")

# lstat meaning link status
# lstat retrivees the file status of symbolic links rather than the file they point to.
# Given information like when is was created, its size...

File.lstat("my_file").mode & 0777

# & is the bitwise AND operator
# In binary '7' is '111' which means read, write and execute permissions

# Use the XOR (^) operator to remove permissions from a bitmap, and the OR operator to add permissions

new_permission = File.lstat("my_file").mode ^ File::O_R
File.chmod(new_permission, "my_file")

p File.lstat("my_file").mode & 0777

# Give everyone acces to everything
new_permission = File.lstat("my_file").mode | File::A_R | File::A_W | File::A_X
File.chmod(new_permission, "my_file")
p File.lstat("my_file").mode & 0777

# Take away the world's write and execute access
new_permission = File.lstat("my_file").mode ^ (File::O_W | File::O_X)
File.chmod(new_permission, "my_file")
p File.lstat("my_file").mode & 0777

class File
  def File.fancy_chmod(permission_string, file)
    mode = File.lstat(file).mode

    permission_string.scan(/[ugoa][+-=][rwx]+/) do |setting|
      who = setting[0..0]
      setting[2..setting.size].each_byte do |perm|
        perm = perm.chr.upcase
        mask = eval("File::#{who.upcase}_#{perm}")
        (setting[1] == ?+) ? mode |= mask : mode ^= mask
      end
    end
    File.chmod(mode, file)
  end
end

##################################################
# NOTE:
# setting[0..0] extract who the permission change is for (u = user, g = group...)
# setting[2..setting.size].each_byte: iterate over each permission character (r, w, x)
# mask = eval, generate a constant to fit the above constants enumeration.
# OR (|=) and XOR (^=)
##################################################

File.fancy_chmod("g-x", "my_file")
File.fancy_chmod("a+rwx", "my_file")
File.fancy_chmod("u+rwxo-x", "my_file")
