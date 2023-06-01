exts = {}
n = gets.to_i
n.times do
  ext, mt = gets.strip.split # get ride of \n and split ' '
  exts[ext.downcase] = mt # hash key from input in downcase
end

q = gets.to_i
q.times do
  fname = gets.strip
  dot_idx = fname.rindex('.') # reverse index
  if dot_idx
    ext = fname[dot_idx+1..-1].downcase # slice notation -1 for the end of string
    if exts.include? ext # so nice to skip those parenthesis
      puts exts[ext]
    else
      puts 'UNKNOWN'
    end
  else
    puts 'UNKNOWN'
  end
end
