require './drink/drink'
require './drink/drink_type'
require './vending_machine'

vm = VendingMachine.new

drink = vm.buy(Coin::FIVE_HUNDRED, DrinkType::COKE)
charge = vm.refund

if drink != nil && drink.coke?
  print "コーラを購入しました。"
  print "お釣りは#{charge}です"
else
  raise StandardError.new("コーラ買えんかった(´ﾟдﾟ｀)")
end

