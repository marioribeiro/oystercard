require 'journey'

describe Journey do

  subject(:journey) { Journey.new }
  let(:station) { double :station}

  describe "#start_journey" do
    it 'set travel to true' do
      expect{ journey.start_journey(station)}.to change{ journey.travelling }.to true 
    end
  end

  describe "#end_journey" do

    it 'sets travel to false' do
      journey.start_journey(station)
      expect{ journey.end_journey(station)}.to change{ journey.travelling }.to false 
    end

  end

end

