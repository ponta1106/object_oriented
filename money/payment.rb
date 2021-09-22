require './money/change'
require './money/coin'

class Payment

  def initialize(coin)
    @coin = coin
  end

  def need_change?
    @coin == Coin::FIVE_HUNDRED
  end

  def commit(cash_box)
    if @coin == Coin::ONE_HUNDRED
      cash_box.add(@coin)
      @change = Change.new
    end

    if @coin == Coin::FIVE_HUNDRED
      @change = Change.new(cash_box.take_out_change)
    end

    @coin = nil
  end

  def refund
    not_commited? ? Change.new([@coin]) : @change
  end

  private

  def not_commited?
    @coin != nil
  end

end