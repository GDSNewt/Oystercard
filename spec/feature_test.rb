require "../lib/oystercard.rb"

oystercard = Oystercard.new

oystercard.balance

oystercard.topup(20)

oystercard.deduct(10)

oystercard.in_journey?

oystercard.touch_in

oystercard.touch_out
