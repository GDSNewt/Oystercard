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

def deduct(money)
  @balance -= money
end

def in_journey?
  @in_journey
end
end
