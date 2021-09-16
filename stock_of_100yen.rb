class StockOf100Yen

  def initialize(quantity)
    @number_of_100yen = [Coin::ONE_HUNDRED] * quantity
  end

  def add(coin)
    @number_of_100yen.push(coin)
  end

  def size
    @number_of_100yen.length
  end

  def pop
    @number_of_100yen.pop
  end

end