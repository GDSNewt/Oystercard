require 'Oystercard'
require 'Station'

describe Station do
let(:train_station) { train_station = Station.new(3) }

  it '#zone tells you what zone a station is in' do
    expect(train_station.zone).to eq(3)
  end
end
