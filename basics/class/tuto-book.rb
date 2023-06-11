# From Programming Ruby 1.9 p 52
class BookInStock
  #attr_reader :isbn, :price
  attr_reader :isbn
  attr_accessor :price
  def initialize(isbn, piece)
    @isbn = isbn
    @price = Float(price)
  end
  
  # setter: method whose name ends with an equals sign (price= )
  #def price=(new_price)
  #  @price = new_price
  #end
  
  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end
end

book = BookInStock.new("isbn1", 33.80)
puts "ISBN  = #{book.isbn}"
puts "Price  = #{book.price}"
book.price = book.price * 0.75 # discount price
puts "New price = #{book.price}"


