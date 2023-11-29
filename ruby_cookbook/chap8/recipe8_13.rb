# Calling a superclass's Method
# Problem:
# When overriding a class's method in a subclass, you want to extend or 
# decorate the behavior of the superclass, rather than totally replacing it.

class Recipe
  def cook(stove, cooking_time)
    dish = prepare_ingredients
    stove << dish
    wait_for(cooking_time)
    return dish
  end
end

class RecipeWithExtraGarlic < Recipe
  def cook(stove, cooking_time)
    5.times { add_ingredient(Garlic.new.chop) }
    super
  end
end

class BakingRecipe < Recipe
  def cook(cooking_time, oven_temperature=350)
    oven = Oven.new(oven_temperature)
    super(oven, cooking_time)
  end
end

class MyString < String
  def gsub(*args)
    return "#{super} -- This string modified by MyString#gsub (TM)"
  end
end

str = MyString.new("Here's my string")
p str.gsub("my", "a")
p str.gsub(/m| s/) { |match| match.strip.capitalize }

class MyString
  def succ!(skip=1)
    skip.times { super() }
    self
  end
end

str = MyString.new('a')
p str.succ!(3)

# Invoking super works for class methods as well as instance methods
class MyFile < File
  def MyFile.ftype(*args)
    return "The type is #{super}."
  end
end
p File.ftype("/bin")
p MyFile.ftype("/bin")


