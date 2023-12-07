# Automatically Initializing Mixed-In Modules
# Problem:
# You've written a module that gets mixed into classes. Your module has some initialization
# code that needs to run whenever the mixed-into class is initialized. You do not want
# users of your module to have to call super in their initialize methods.

class Class
  def included_modules
    @included_modules ||= []
  end

  alias_method :old_new, :new
  def new(*args, &block)
    obj = old_new(*args, &block)
    self.included_modules.each do |mod|
      mod.initialize if mod.respond_to?(:initialize)
    end
    obj
  end
end

module Initializable
  def self.included(mod)
    mod.extend ClassMethods
  end
  module ClassMethods
    def included(mod)
      if mod.class != Module #in case Initializeable is mixed-into a class
        puts "Adding #{self} to #{mod}'s included_modules" if $DEBUG
        mod.included_modules << self
      end
    end
  end
end

module A
  include Initializable
  def self.initialize
    puts "A's initialized"
  end
end

module B
  include Initializable
  def self.initialize
    puts "B's initialized"
  end
end

class BothAandB
  include A
  include B
end

both = BothAandB.new
