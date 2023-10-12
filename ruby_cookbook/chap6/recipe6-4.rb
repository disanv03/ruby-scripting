# Seeing when a file was last used problem
# Problem:
# You want to see when a file was last accessed or modified

open("output", "w") {|f| f << "Here's some output.\n"}
stat = File.stat("output")
p stat.mtime
p stat.atime

sleep(2)
open("output", "a") {|f| f << "Here's some more output.\n"}
stat = File.stat("output")
p stat.mtime
p stat.atime

sleep(2)
open("output") { |f| contents = f.read }
stat = File.stat("output")
p stat.mtime
p stat.atime

# A file's atime changes whenever data is read from the file
# and mtile changes whenever data is written to the file

def save_game(file)
  score = 1000
  open(file, "w") do |f|
    f.puts(score)
    f.puts(Time.new.to_i)
  end
end

def load_game(file)
  open(file) do |f|
    score = f.readline.to_i
    time = Time.at(f.readline.to_i)
    difference = (File.stat(file).mtime - time).abs
    raise "I suspect you of cheating." if difference > 1
    "Your saved score is #{score}."
  end
end

save_game("game.sav")
sleep(2)
load_game("game.sav")

open("game.sav", "r+b") { |f| f.write("9") }
load_game("game.sav")
