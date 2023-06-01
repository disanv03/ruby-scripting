l = gets.to_i
h = gets.to_i
t = gets.chomp

# see ascii_art.txt.rb to see what the ascii array look like
ascii = []
h.times do
  ascii << gets.chomp
end


h.times do |i|
  t.each_char do |c|
    c = c.upcase
    if c >= 'A' && c <= 'Z'
      index = c.ord - 'A'.ord
    else
      index = 26
    end
    print ascii[i][index * l, l]
  end
  puts
end
