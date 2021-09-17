class StockOf100Yen

  def initialize(quantity)
    @number_of_100yen = [Coin::ONE_HUNDRED] * quantity
  end

  def add(coin)
    @number_of_100yen.push(coin)
  end

  def not_have_change?
    size < 4
  end

  def take_out_change
    coins = []
    4.times do
      coins.push(pop)
    end
    coins
  end

  private

  def size
    @number_of_100yen.length
  end

  def pop
    @number_of_100yen.pop
  end

end