require 'Oystercard'

describe 'Oystercard' do
  let(:oystercard) { oystercard = Oystercard.new }
  # attr_accessor :balance

  it "expects a newly initialized Oystercard to mave a balance of zero" do
  expect(oystercard.balance).to eq (0)
end
  it "adds funds to oystercard" do
    expect{ oystercard.topup 5 }.to change { oystercard.balance }.by 5
  end
  it "it throws an exception if balance goes over 90" do
    max_balance = Oystercard::MAX_VALUE
    oystercard.topup(max_balance)
    expect{oystercard.topup 1 }.to raise_error 'maximum value exceeded'
  end

  it "deducts money from the balance" do
    oystercard.topup(50)
    expect{oystercard.deduct 25}.to change { oystercard.balance }.by -25
  end
end
