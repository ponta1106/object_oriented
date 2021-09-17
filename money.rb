class Money
  def initialize(amount)
    @amount = amount
  end

  def add(money)
    Money.new(@amount + money.amount)
  end

  def to_i
    @amount
  end

  def to_s
    @amount.to_s
  end
end