# Listening the changes of a class
# Problem:
# You want to be notified when the definiton of a class changes. You
# might want to keep track of new methods added to the class, or existing
# methods that get removed or undefined. Being notified when a module is
# mixed into a class can also be useful

class Tracker
  def important
    "This is an important method!"
  end

  def self.method_added(sym)
    if sym == :important
      raise 'The "important" method has been redefined!'
    else
      puts %{Method "#{sym}" was (re)defined. }
    end
  end

  def self.method_removed(sym)
    if sym == :important
      raise 'The "important" method has been removed!'
    else 
      puts %{Method "#{sym}" was removed.}
    end
  end

  def self.method_undefined(sym)
    if sym == :important
      raise 'The "important" method has been undefined!'
    else
      puts %{Method "#{sym}" was removed.}
    end
  end
end

class Tracker
  undef :important
end

class Tracker
  include Enumerable
end

# Nothing !

# Define a hook method for module inclusion

class Module
  alias_method :include_no_hook, :include
  def include(*modules)
    # Run the old implementation.
    include_no_hook(*modules)

    # Then run the hook
    modules.each do |mod|
      self.include_hook mod
    end
  end

  def include_hook
    # Do nothing by default, just like Module#method_added
    # This method must be overridden in a subclass to do something useful.
  end
end

class Tracker
  def self.include_hook(mod)
    puts %{"#{mod}" was included in #{self}.}
  end
end

class Tracker
  include Enumerable
end
# "Enumerable" was included in Tracker.
