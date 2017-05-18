require_relative '../lib/journey_log'

describe JourneyLog do
  subject(:journey_log) { JourneyLog.new(journey_class) }
  let(:journey) { double(:journey, start_journey: nil, end_journey: nil, info: :journey_info) }
  let(:journey_class) { double(:journey_class, new: journey) }

  it { is_expected.to respond_to(:start).with(1).argument }
  it { is_expected.to respond_to(:journeys) }

  it 'requires one argument on instantiation' do
    expect(journey_log.journey_class).to eq journey_class
  end

  describe '#start' do
    it 'starts a new journey when called' do
      expect(journey).to receive(:start_journey)
      journey_log.start(:station)
    end
  end

  describe '#finish' do
    it 'ends the current journey when called' do
      journey_log.start(:station)
      expect(journey).to receive(:end_journey)
      journey_log.finish(:station)
    end
  end

  describe '#journeys' do
    it 'records completed journeys' do
    journey_log.start('A'); journey_log.finish('Z')
    expect(journey_log.journeys).to include(:journey_info)
    end
  end

end
