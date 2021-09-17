require 'test/unit'
require './vending_machine'
require './drink_type'
require './coin'

class VendingMachineTest < Test::Unit::TestCase
  def setup
    @vm = VendingMachine.new
  end

  def test500円でコーラを購入
    drink = @vm.buy(Coin::FIVE_HUNDRED, DrinkType::COKE)
    change = @vm.refund

    assert_equal(true, drink.coke?)
    assert_equal('400', change.to_s)
  end

  def test10円ではコーラは買えない
    drink = @vm.buy(10, DrinkType::COKE)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal('10', change.to_s)
  end

  def testコーラの在庫が無いときにコーラは買えない
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::COKE)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::COKE)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::COKE)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::COKE)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::COKE)
    drink = @vm.buy([Coin::ONE_HUNDRED], DrinkType::COKE)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal('100', change.to_s)
  end

  def testダイエットコーラの在庫が無いときにコーラは買えない
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::DIET_COKE)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::DIET_COKE)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::DIET_COKE)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::DIET_COKE)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::DIET_COKE)
    drink = @vm.buy(Coin::ONE_HUNDRED, DrinkType::DIET_COKE)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal([Coin::ONE_HUNDRED], change)
    assert_equal('100', change.to_s)
  end

  def testお茶の在庫が無いときにコーラは買えない
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::TEA)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::TEA)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::TEA)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::TEA)
    @vm.buy(Coin::ONE_HUNDRED, DrinkType::TEA)
    drink = @vm.buy(Coin::ONE_HUNDRED, DrinkType::TEA)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal([Coin:ONE_HUNDRED], change)
    assert_equal('100', change.to_s)
  end

  def test釣り銭が足りないときにコーラは買えない
    @vm.buy([Coin::FIVE_HUNDRED], DrinkType::COKE)
    @vm.refund
    @vm.buy([Coin::FIVE_HUNDRED], DrinkType::COKE)
    @vm.refund
    drink = @vm.buy(Coin::FIVE_HUNDRED], DrinkType::COKE)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal([Coin::FIVE_HUNDRED], change)
    assert_equal('500', change.to_s)
  end

end

