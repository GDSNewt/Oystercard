class Oystercard
attr_reader :balance, :entry_station, :exit_station, :journeys
MAX_VALUE = 90
MIN_VALUE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = {}
  end

  def topup(money)
    raise'maximum value exceeded' if @balance + money > MAX_VALUE
    @balance += money
  end

  def in_journey?
     @entry_station == nil ? false : true
    #@in_journey
  end

  def touch_in(entry_station)
    raise "Balance too low" if @balance < MIN_VALUE
    @entry_station = entry_station
    @journeys[@entry_station] = nil
  end

  def touch_out(exit_station)
    deduct(1)
    @exit_station = exit_station
    @journeys[@entry_station] = @exit_station
    @entry_station = nil
  end

private

  def deduct(money)
    @balance -= money
  end
end
