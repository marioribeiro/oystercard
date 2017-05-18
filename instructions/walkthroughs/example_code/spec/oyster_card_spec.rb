require 'oyster_card'
describe OysterCard do
  let(:station){double(:station)}
  let(:journey){double :journey, fare: 5, complete?: true}
  let(:journey_log){double :journey_log, all: [journey], exit_journey: journey, outstanding_charges: 0}
  subject(:oystercard){described_class.new(journey_log: journey_log)}

  it 'has a balance of zero' do
    expect(oystercard.balance).to eq(0)
  end

  it "can top up the balance" do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq(10)
  end

  it "can't deduct if the balance goes below zero" do
    expect{oystercard.touch_in(station)}.to raise_error(BalanceError, "Insufficient balance to touch in.")
  end

  it "won't let you touch in if you don't have enough balance" do
    expect{oystercard.touch_in(station)}.to raise_error(BalanceError, "Insufficient balance to touch in.")
  end

  context 'it has a full balance' do
    before{oystercard.top_up(OysterCard::BALANCE_LIMIT)}

    it "won't let you top up over the balance limit" do
      expect{oystercard.top_up(1)}.to raise_error(BalanceError, "Exceeds #{OysterCard::BALANCE_LIMIT}")
    end

    it "knows what station in touched in at" do
      expect(journey_log).to receive(:start_journey).with(station)
      oystercard.touch_in(station)
    end

    it "informs journey log in which station it touched out" do
      expect(journey_log).to receive(:exit_journey).with(station)
      oystercard.touch_out(station)
    end


    context 'when touched in' do
      before do
        allow(journey_log).to receive(:start_journey)
        oystercard.touch_in(station)
      end

      it "deducts the charge from the balance when touching out" do
        expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-journey.fare)
      end

      it "will notify journey log to close previous fares" do
        expect(journey_log).to receive(:outstanding_charges)
        oystercard.touch_in(station)
      end

      it "will charge for the previous fare if you touch in twice" do
        allow(journey_log).to receive(:outstanding_charges).and_return(6)
        expect{oystercard.touch_in(station)}.to change{oystercard.balance}.by(-6)
      end
    end
  end
end
