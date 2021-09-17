class Stock

  def initialize(quantity)
    @quantity = quantity
  end

  def quantity
    @quantity
  end

  def decrement
    @quantity -= 1
  end

  def empty?
    @quantity == 0
  end

end