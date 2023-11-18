# Managing Class Data
# Problem:
# Instead of storing a bit of data along with every instance of a class,
# you want to store a bit of data along with the class itself.

class Sign
  @@translations = { :en => 'Wet Floor',
                     :es => 'Piso Mojado' }

  def initialize(language=:en)
    @language = language
  end

  def warn
    @@translations[@language]
  end
end

p Sign.new.warn
p Sign.new(:es).warn

class Fate
  NAMES = ['Klotho', 'Atropos', 'Lachesis'].freeze
  @@number_instantiated = 0

  def initialize
    if @@number_instantiated >= NAMES.size
      raise ArgumentError, 'Sorry, there are only three Fates.'
    end
  @name = NAMES[@@number_instantiated]
  @@number_instantiated += 1
  puts "I give you... #{@name}!"
  end
end

Fate.new
Fate.new
Fate.new

class Module
  def class_attr_reader(*symbols)
    symblos.each do |symbol|
      self.class.send(:define_method, symbol) do
        class_variable_get("@@#{symbol}")
      end
    end
  end

  def class_attr_write(*symbols)
    symbols.each do |symbol|
      self.class.send(:define_method, "#{symbol}") do |value|
        class_variable_set("@@#{symbol}", value)
      end
    end
  end

  def class_attr_accessor(*symbols)
    class_attr_reader(*symbols)
    class_attr_write(*symbols)
  end
end