require_relative '../lib/journey_log'

describe JourneyLog do
  subject(:journey_log) { JourneyLog.new(:journey_class) }

  it 'requires one argument on instantiation' do
    expect(journey_log.journey_class).to eq :journey_class
  end

  it { is_expected.to respond_to(:start).with(1).argument }

  it { is_expected.to respond_to(:journeys) }

end
