# Avoiding naming collisions with namespaces
# Problem:
# You want to define a class or module whose name conflicts with
# an existing class or module, or you wan to prevent someone else
# from coming along later and defining a class whose name conflicts
# with yours.

module StringTheory
  class String
    def initialize(length=10**-33)
      @length = length
    end
  end
end

p String.new # => ""
p StringTheory::String.new

module StringTheory2
  RubyString = String
  class String
    def initialize(length=10**-33)
      @length = length
    end
  end

  p RubyString.new("This is a built-in string, not a StringTheory2::String")
end
