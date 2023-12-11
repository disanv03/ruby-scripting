# Fixing bugs in someone's else's class
# Problem:
# You're using a class that's got a bug in one of its methods. You know
# where the bug is and how to fix it, but you can't or don't want to
# change the source file itself

class Multiplier
  def double_your_pleasure(pleasure)
    return pleasure * 3 # FIXME: actually triples your pleasure.
  end
end

m = Multiplier.new
m.double_your_pleasure(6) # => 18

class Multiplier
  alias :double_your_pleasure_BUGGY :double_your_pleasure

  def double_your_pleasure(pleasure)
    return pleasure * 2
  end
end

m.double_your_pleasure(6) # => 12
m.double_yout_pleasure(6) # => 18
