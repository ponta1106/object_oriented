require './stock'

class Storage

  def initialize
    @stocks = {}
    @stocks[DrinkType::COKE] = Stock.new(5)
    @stocks[DrinkType::DIET_COKE] = Stock.new(5)
    @stocks[DrinkType::TEA] = Stock.new(5)
  end

  def empty?(type)
    @stocks[type].empty?
  end

  def decrement(type)
    @stocks[type].decrement
  end

end