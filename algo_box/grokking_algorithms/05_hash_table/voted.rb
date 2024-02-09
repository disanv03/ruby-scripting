voted = {}

def check_voter(name, voted)
  if voted[name]
    puts "kick them out"
  else
    voted[name] = true
    puts "let them vote!"
  end
end

check_voter("tom", voted)
check_voter("mike", voted)
check_voter("mike", voted)

