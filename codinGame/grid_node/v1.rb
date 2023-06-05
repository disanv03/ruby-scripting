width = gets.to_i # the number of cells on the X axis
height = gets.to_i # the number of cells on the Y axis
grid = []
height.times do
  line = gets.chomp # width characters, each either 0 or .
  grid.push(line.split(' '))
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

height.times do |y1|
  width.times do |x1|
    if grid[y1][x1] == '0'
      x2, y2, x3, y3 = -1, -1, -1, -1

      for i in (x1 + 1)...width
        if grid[y1][i] == "0"
          x2, y2 = i, y1
          break
        end
      end

      for i in (y1 + 1)...height
        if grid[i][x1] == "0"
          x3, y3 = x1, i
          break
        end
      end

      puts "#{x1} #{y1} #{x2} #{y2} #{x3} #{y3}"
    end
  end
end

