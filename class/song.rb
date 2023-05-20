class song
  def initialize name, artist, duration
    @name = name
    @artist = artist
    @duration = duration
  end

  def to_s
    "Song: #@name--#@artist(#@duration)"
  end
end


#-------------

song = Song.new "Yoooooo", "Mr.funnyMan", 1
puts song.inspect
puts song.to_s
