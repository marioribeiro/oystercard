require 'station'

describe Station do
  subject(:station) { Station.new(name: "Makers", zone: 1) }

  it "returns the name" do
    expect(station.name).to eq "Makers"
  end

  it "returns the zone" do
    expect(station.zone).to eq 1
  end
end
