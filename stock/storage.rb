require './stock/stock'
require './drink/drink_type'
require './drink/drink'

class Storage

  def initialize
    @stocks = {}
    @stocks[DrinkType::COKE] = Stock.new(5)
    @stocks[DrinkType::DIET_COKE] = Stock.new(5)
    @stocks[DrinkType::TEA] = Stock.new(5)
  end

  def not_have_stock?(type)
    @stocks[type].empty?
  end

  def take_out(type)
    @stocks[type].decrement
    Drink.new(type)
  end

end