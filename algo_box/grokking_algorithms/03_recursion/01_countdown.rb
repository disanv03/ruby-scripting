def countdown(i)
  puts i
  # base case
  if i <= 0
    return
  # recusive case
  else
    countdown(i - 1)
  end
  # illustating the return from top pile to bottom
  # action can still be done here:
   puts i if i % 2 == 0
end

countdown(6)
