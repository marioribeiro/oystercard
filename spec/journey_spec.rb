require 'journey'

describe Journey do

  subject(:journey) { Journey.new }
  let(:start_station) { double :start_station}
   let(:end_station) { double :end_station}

  describe "#start_journey" do
    it 'stores the start station' do
      journey.start_journey(start_station)
      expect(journey.info[:start]).to eq start_station
    end
  end


  describe "#end_journey" do
    it 'stores the end station' do
      journey.end_journey(end_station)
      expect(journey.info[:end]).to eq end_station
    end
  end

  describe "#fare" do
    it 'returns minimum fare if its a complete journey' do
      journey.start_journey(start_station)
      journey.end_journey(end_station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'return penalty fare if starting a new journey, without closing previous' do
      journey.start_journey(start_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end

end
