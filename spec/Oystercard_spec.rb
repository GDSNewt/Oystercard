require 'Oystercard'

describe 'Oystercard' do
  # attr_accessor :balance

  it "expects a newly initialized Oystercard to mave a balance of zero" do
  oystercard = Oystercard.new
  expect(oystercard.balance).to eq (0)
end
end
