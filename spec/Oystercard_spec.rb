require 'Oystercard'

describe 'Oystercard' do
  let(:oystercard) { oystercard = Oystercard.new }
  let(:station) {double:station}
  let(:station2) {double:station2}
  # attr_accessor :balance

  it "expects a newly initialized Oystercard to mave a balance of zero" do
    expect(oystercard.balance).to eq (0)
  end

  it "expects a newly initialized Oystercard to have no history of journeys" do
    expect(oystercard.journeys).to be {}
  end

  it "adds funds to oystercard" do
    expect{ oystercard.topup 5 }.to change { oystercard.balance }.by 5
  end

  it "it throws an exception if balance goes over 90" do
    max_balance = Oystercard::MAX_VALUE
    oystercard.topup(max_balance)
    expect{oystercard.topup 1 }.to raise_error 'maximum value exceeded'
  end

  it "#In_journey will default as false upon initialization" do
    expect(oystercard.in_journey?).to eq false
  end

  it "error raised if touching in when balance is below £1" do
    oystercard.balance
    expect{ oystercard.touch_in(station) }.to raise_error "Balance too low"
  end

  describe "Tests arranged with #topped up, #touched_in" do

    before (:each) do
      oystercard.topup(10)
      oystercard.touch_in(station)
    end

    it "touching in will make the value of in journey true" do
      expect(oystercard.in_journey?).to eq true
    end

    it "#touch_out to change balance by £1" do
      expect{ oystercard.touch_out(station2) }.to change{ oystercard.balance }.by -1
    end

    it "remembers the station where you touched in" do
      expect(oystercard.entry_station).to eq station
    end
  end

  describe "Tests arranged with #topped up, #touched_in and #touched_out" do

    before (:each) do
      oystercard.topup(10)
      oystercard.touch_in(station)
      oystercard.touch_out(station2)
    end

    it "entry_station is nil when #touch_out" do
      expect(oystercard.entry_station).to eq nil
    end

    it "#touch_out remembers exit station" do
      expect(oystercard.exit_station).to eq station2
    end

    it "#touch_out will make in_journey? false" do
      expect(oystercard.in_journey?).to eq false
    end

    it "journeys contains an exit and entry station" do
      expect(oystercard.journeys).to include(station => station2)
    end

  end
end
