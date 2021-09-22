class Drink

  def initialize(kind)
    @kind = kind
  end

  def coke?
    @kind == DrinkType::COKE
  end

  def diet_coke?
    @kind == DrinkType::DIET_COKE
  end

  def tea?
    @kink == DrinkType::TEA
  end
end

