class Change
  def initialize(coins = [])
    @coins = coins    
  end

  def add(coin)
    @coins.push(coin)
  end

  def add_all(coins)
    @coins.concat(coins)
  end

  def amount
    @coins.sum
  end

  def clear
    @coins = []    
  end

  def clone
    Change.new(@coins.clone)
  end

  def to_s
    @coins.sum{|c| c.to_i}.to_s
  end
end