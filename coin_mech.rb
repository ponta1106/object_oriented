require './cash_box'
require './change'

class CoinMech

  def initialize
    @cash_box = CashBox.new(10)
    @change = Change.new
  end

  def add_coin_into_change(payment)
    @change.add(payment)
  end

  def add_change(change)
    @change.add_all(change)
  end

  def add_coin_into_cash_box(payment)
    @cash_box.add(payment)
  end

  def not_have_change?
    @cash_box.not_have_change?
  end

  def take_out_change
    @cash_box.take_out_change
  end

  def refund
    result = @change.clone
    @change.clear
    result
  end

end