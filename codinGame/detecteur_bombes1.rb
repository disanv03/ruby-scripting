# w: width of the building.
# h: height of the building.
w, h = gets.split(" ").collect { |x| x.to_i }
n = gets.to_i # maximum number of turns before game over.
x, y = gets.split(" ").collect { |x| x.to_i }

up = 0
down = h
left = 0
right = w


# game loop
loop do
  bomb_dir = gets.chomp # the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."
  if bomb_dir.include? 'U'
    down = y
  elsif bomb_dir.include? 'D'
    up = y
  end

  if bomb_dir.include? 'L'
    right = x
  elsif bomb_dir.include? 'R'
    left = x
  end

  x = (left + right) / 2
  y = (up + down) / 2

  # the location of the next window Batman should jump to.
  puts "#{x} #{y}"
end

