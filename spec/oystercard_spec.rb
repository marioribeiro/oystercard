require 'oystercard'

describe Oystercard do

  subject(:card) { Oystercard.new }

  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:top_up).with(1).argument }
  it { is_expected.to respond_to(:touch_in) }
  it { is_expected.to respond_to(:touch_out)}
  it { is_expected.to respond_to(:in_journey) }
  it { is_expected.to respond_to(:in_journey?)}


  describe '#balance' do
    it 'returns the balance' do
      expect(card.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up Oystercard::MAXIMUM_BALANCE }.to change{ subject.balance }.by Oystercard::MAXIMUM_BALANCE
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up(1) }.to raise_error "Error: Maximum balance of #{maximum_balance} exceeded"
    end
  end

  describe '#touch_in' do
    it 'sets instance variable "in_journey" to true' do
      card.top_up(Oystercard::MAXIMUM_BALANCE)
      card.touch_in
      expect(card).to be_in_journey
    end
    it 'prevents touching in if balance is below the minimum balance' do
      expect{ card.touch_in}.to raise_error "Error: You need to top up"
    end
  end

  describe '#touch_out' do
    it 'sets instance variable "in_journey to false' do
      card.touch_out
      expect(card).to_not be_in_journey
    end
    it 'deducts minimum fare' do
      card.top_up(Oystercard::MINIMUM_BALANCE)
      expect{ card.touch_out }.to change{ card.balance }.by -Oystercard::MINIMUM_FARE
    end
  end

  describe '#in_journey?' do
    it 'returns true or false' do
      expect(card.in_journey?).to be(true).or be(false)
    end
  end
end
