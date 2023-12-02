# Simulating Multiple Inheritance with Mixins
# Problem:
# You want to create a class that derives from two or more sources, but Ruby doesn't
# support multiple inheritance.

require 'set'

module Taggable
  attr_accessor :tags

  def taggable_setup
    @tags = Set.new
  end

  def add_tag(tag)
    @tags << tag
  end

  def remove_tag(tag)
    @tags.delete(tag)
  end
end

class TaggableString < String
  include Taggable
  def initialize(*args)
    super
    taggable_setup
  end
end

s = TaggableString.new('It was the best of times, it was the worst of times.')
s.add_tag 'dickens'
s.add_tag 'quotation'
p s.tags # => #<Set: {"dickens", "quotation"}>

# A Ruby class can only have one superclass, but it can include any number of modules.
# These modules are called mixins. If your write a chunk of code that can add functionality
# to classes in general, it should go into a mixin module instead of a class.

# The only objects that need to be defined as classes are the ones that get instantiated
# and used on their own (modules can't be instantiated)

module Complaint
  def gripe
    voice('In all my years I have never encountered such behavior...')
  end

  def faint_praise
    voice('I am pleased to notice some improvement, however slight...')
  end

  def voice(complaint_text)
    raise NotImplementedError,
      "#{self.voice} included the Complaint module but didn't define voice!"
  end
end

class MyComplaint
  include Complaint
end

#MyComplaint.new.gripe # NotImplementedError: MyComplaint included the Complaint module
# but didn't define voice!

module Ayto
  def potato
    'Pohtayto'
  end
end

module Ahto
  def potato
    'Pahtahto'
  end
end

class Potato
  include Ayto
  include Ahto
end

p Potato.new.potato
