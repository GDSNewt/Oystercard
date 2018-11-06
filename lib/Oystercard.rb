class Oystercard
attr_reader :balance
MAX_VALUE = 90

def initialize
  @balance = 0

end
def topup(money)
  raise'maximum value exceeded' if @balance + money > MAX_VALUE
  @balance += money
end

end
