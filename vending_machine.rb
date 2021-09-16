require './drink'
require './coin'
require './stock'
require './stock_of_100yen'
require './change'

class VendingMachine

  def initialize
    @stock_of_coke = Stock.new(5) # コーラの在庫数
    @stock_of_diet_coke = Stock.new(5) # ダイエットコーラの在庫数
    @stock_of_tea = Stock.new(5) # お茶の在庫数
    @number_of_100yen = [Coin::ONE_HUNDRED] * 10 # 100円玉の在庫
    @change = [] # お釣り
    @stock_of_100yen = StockOf100Yen.new(10)
    @change = Change.new
  end

  def buy(payment, kind_of_drink)
    # [Coin::ONE_HUNDRED]円と500円だけ受け付ける
    if payment != Coin::ONE_HUNDRED && payment != Coin::FIVE_HUNDRED
      @change.add(payment)
      return nil
    end

    if kind_of_drink == DrinkType::COKE && @stock_of_coke.quantity == 0
      @change.add(payment)
      return nil
    elsif kind_of_drink == DrinkType::DIET_COKE && @stock_of_diet_coke.quantity == 0 then
      @change.add(payment)
      return nil
    elsif kind_of_drink == DrinkType::TEA && @stock_of_tea.quantity == 0 then
      @change.add(payment)
      return nil
    end

    # 釣り銭不足
    if payment == Coin::FIVE_HUNDRED && @number_of_100yen.length < 4
      @change.add(payment)
      return nil
    end

    if payment == Coin::ONE_HUNDRED
      @number_of_100yen.add(payment)
    elsif payment == Coin::FIVE_HUNDRED then
      @change = @change.concat(calculate_change)
      @change.add_all(calculate_change)
    end

    if kind_of_drink == DrinkType::COKE
      @stock_of_coke.decrement
    elsif kind_of_drink == DrinkType::DIET_COKE then
      @stock_of_diet_coke.decrement
    else
      @stock_of_tea.decrement
    end

    Drink.new(kind_of_drink)
  end

  def refund
    result = @change.clone
    @change.clear
    result
  end

  def calculate_change
    @number_of_100yen.slice!(0, 4)
    [Coin::ONE_HUNDRED] * 4
    coins = []
    4.times do
      coins.push(@stock_of_100yen.pop)
    end
    coins
  end

end
