require_relative '../lib/journey_log'

describe JourneyLog do

  subject(:journey_log) { JourneyLog.new(journey_class) }
  let(:journey) { double(:journey, start_journey: nil) }
  let(:journey_class) { double(:journey_class, new: journey)}
  
  it { is_expected.to respond_to(:start).with(1).argument }
  it { is_expected.to respond_to(:journeys) }


  it 'requires one argument on instantiation' do
    expect(journey_log.journey_class).to eq journey_class
  end

  describe "#start" do
    
    it 'starts a new journey when called' do
      expect(journey).to receive (:start_journey)
      journey_log.start(:station)
    end

  end


end
