# Aliasing methods
# Problem:
# You (or your users) frequently misremember the name of a method. To reduce the 
# confusion, you want to make the same method accessible unde multiple names.
# Alternatively, you're about to redefine a method and you'd like to keep the old 
# version available.

class InventoryItem
  attr_accessor :name, :unit_price

  def initialize(name, unit_price)
    @name, @unit_price = name, unit_price
  end

  def price(quantity=1)
    @unit_price * quantity
  end

  # Make InventoryItem#cost an alias for InventoryItem#price
  alias :cost :price

  # The attr_accessor decorator created two methods called "unit_price" and "unit_price="
  alias :unit_cost :unit_price
  alias :unit_cost= :unit_price=
end

bacon = InventoryItem.new("Chunky Bacon", 3.95)
p bacon.price(100)
p bacon.cost(100)
p bacon.unit_price
p bacon.unit_cost
p bacon.unit_cost = 3.99
p bacon.cost(100)

class Array
  alias :len :length
end

p [1, 2, 3, 4].len

class Array
  alias :length_old :length
  def length
    return length_old / 2
  end
end

array = [1, 2, 3, 4]
p array.length
p array.size
p array.length_old

class Array
  alias :length :length_old
end

p array.length

# Here I'll modify the InventoryItem class so that "cost" delegates to "price",
# rather than having alias create a copy of price and calling the copy cost

class InventoryItem
  def cost(*args)
    price(*args)
  end
end

p bacon.cost(100)

require 'bigdecimal'
require 'bigdecimal/util'
class InventoryItem
  def price(quantity=1, sales_tax= BigDecimal("0.0725"))
    base_price = (unit_price * quantity).to_d
    price = (base_price + (base_price * sales_tax).round(2)).to_f
  end
end

p bacon.price(100)
p bacon.cost(100)

p bacon.cost(100, BigDecimal("0.05"))
