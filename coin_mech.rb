require './cash_box'
require './change'
require './payment'

class CoinMech

  def initialize
    @cash_box = CashBox.new(10)
    @change = Change.new
  end

  def put(coin)
    @payment = Payment.new(coin)
  end

  def not_have_change?
    @cash_box.not_have_change?
  end

  def refund
    @payment.refund
  end

  def commit
    @payment.commit(@cash_box)
  end

end