require 'journey_log'
describe JourneyLog do

  let(:journey){ double :journey, entry_station: nil, complete?: false, fare: 1}
  let(:station){ double :station }
  let(:journey_class){double :journey_class, new: journey}
  subject(:journey_log){described_class.new(journey_class: journey_class)}

  describe '#start_journey' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(entry_station: station)
      journey_log.start_journey(station)
    end

    it 'records a journey' do
      journey_log.start_journey(station)
      expect(journey_log.journeys).to include(journey)
    end
  end

  it 'stops a current journey' do
    allow(journey_class).to receive(:new).and_return journey
    journey_log.start_journey(station)
    expect(journey).to receive(:exit).with(station)
    journey_log.exit_journey(station)
  end

  it 'creates a journey if there is no current journey' do
    expect(journey_class).to receive(:new).and_return(journey)
    allow(journey).to receive(:exit).with(station)
    journey_log.exit_journey(station)
  end

  it "returns a new journey when stopping when no current journeys" do
    allow(journey_class).to receive(:new).and_return journey
    allow(journey).to receive(:exit).with(station).and_return(journey)
    expect(journey_log.exit_journey(station)).to eq journey
  end

  it "returns an open journey when stopping" do
    allow(journey_log).to receive(:journeys).and_return([journey])
    allow(journey).to receive(:exit).with(station).and_return(journey)
    expect(journey_log.exit_journey(station)).to eq journey
  end
  
  context "with an open journey" do
    before do
      journey_log.start_journey(station)
      allow(journey).to receive(:entry_station).and_return(station)
    end

    it "wont let you start a new journey if there is a current journey" do
      expect{journey_log.start_journey(station)}.to raise_error("Already in a Journey.")
    end

    it "can return a penalty fare" do
      allow(journey).to receive(:exit).with(no_args).and_return(journey)
      expect(journey_log.outstanding_charges).to eq journey.fare
     end

    it 'returns no charge for completed journeys' do
      allow(journey).to receive(:exit).with(station).and_return(journey)
      allow(journey).to receive(:complete?).and_return(true)
      expect(journey_log.outstanding_charges).to eq JourneyLog::NO_CHARGE 
    end
  end

  it "wont allow amdendments to journeys" do
    journey_log.journeys << :bad_stuff
    expect(journey_log.journeys).not_to include :bad_stuff
  end

end
