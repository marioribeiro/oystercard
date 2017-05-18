require 'journey'
describe Journey do
  subject(:journey){described_class.new(entry_station: :station)}

  it 'is created with an entry station' do
    expect(journey.entry_station).to eq :station
  end

  it "knows if a journey is not complete" do
    expect(journey).not_to be_complete
  end

  describe '#fare' do

    let(:station) { double :station, zone: 1}
    let(:other_station) { double :other_station }
    let(:penalty_station) {double :penalty_station, zone: 0}

    it 'has a penalty fare by default' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "returns itself when exiting a journey" do
      expect(journey.exit(station)).to eq(journey)
    end

    context 'given an entry station' do
      subject(:journey){described_class.new(entry_station: station)}

      it "returns a penalty fare if no exit station given" do
        journey.exit
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end

      it "completes journey if exit with no station given" do
        journey.exit
        expect(journey).to be_complete
      end

      context 'given an exit station' do
        before do
          journey.exit(other_station)
        end

        it 'calculates a fare for zone 1 to zone 1' do
          update_zones(1,1)
          expect(journey.fare).to eq 1
        end

        it 'calculates a fare for zone 1 to zone 2' do
          update_zones(1,2)
          expect(journey.fare).to eq 2
        end

        it 'calculates a fare for zone 6 to zone 5' do
          update_zones(6,5)
          expect(journey.fare).to eq 2
        end

        it 'calculates a fare for zone 6 to zone 1' do
          update_zones(6,2)
          expect(journey.fare).to eq 5
        end

        it "knows if a journey is complete" do
          expect(journey).to be_complete
        end

        def update_zones(entry_zone, exit_zone)
          allow(station).to receive(:zone).and_return(entry_zone)
          allow(other_station).to receive(:zone).and_return(exit_zone)
        end
      end
    end
  end
end
