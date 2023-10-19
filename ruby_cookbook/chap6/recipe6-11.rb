# Performing Random Access on "Read-Once" Input Streams
# Problem:
# You have an IO object, probably a socket, that doesn't support random-access
# methods like seek, pos=, and rewind. You want to treat this object like a file on
# disk, where you can jump around and reread parts of the file.

require 'socket'
require 'stringio'

# You can treat the StringIO object exactly like a file

sock = TCPSocket.open("www.example.com", 80)
sock.write("GET /\n")

file = StringIO.new(sock.read)
file.read(10)

file.rewind
p file.read(10)
file.pos = 90
p file.read(15)

# Wrapper around IO object
# Buffered reading from the source IO object, ensuring that
# reading operations are more efficient

class BufferedIO
  def initialize(io)
    @buff = StringIO.new
    @source = io
    @pos = 0
  end

  # Read 'x' bytes from the buffer.
  # If not enough data in buffer, it reads more from the source IO
  def read(x=nil)
    to_read = x ? x + @buff.pos - @buff.size : nil
    _append(@source.read(to_read)) if !to_read or to_read > 0
    @buff.read(x)
  end

  # Sets the position in the buffer
  def pos=(x)
    read(x - @buff.pos) if x > @buff.size
    @buff.pos = x
  end

  # Implements seeking capability in the buffered IO
  def seek(x, whence=IO::SEEK_SET)
    case whence
    when IO::SEEK_SET then self.pos = x
    when IO::SEEK_CUR then self.pos = @buff.pos + x
    when IO::SEEK_END
      read
      self.pos = @buff.size - x
    end
    pos
  end

  ["pos", "rewind", "tell"].each do |m|
    module_eval "def #{m}\n@buff.#{m}\nend"
  end

  private
  # Appends new data to the buffer and adjusts buffer's position.
  def _append(s)
    return unless s # guard clause to return if s is nil
    @buff << s
    @buff.pos -= s.size
  end
end

sock = TCPSocket.open("www.example.com", 80)
sock.write("GET /\n")
file = BufferedIO.new(sock)
file.read(10)
file.rewind
file.read(10)
file.pos = 90
file.read(15)
file.seek(-10, IO::SEEK_CUR)
file.read(10)

class BufferedIO
  def readline
    # save the current pos
    oldpos = @buff.pos
    # attempt to read a line from buffer
    line = @buff.readline unless @buff.eof?

    # check if the read line is incomplete
    if !line or line[-1] != ?\n
      # read complete line and append to the buffer
      _append(@source.readline)
      # restore buffer pos, to save the pos
      @buff.pos = oldpos
      # read again the line with update
      line = @buff.readline
    end
    line
  end
end

source_io = StringIO.new("by typing \"example.com\", \r\nand some other content.")
file = BufferedIO.new(source_io)
puts file.readline
