require 'oystercard'

describe Oystercard do

  subject(:card) { Oystercard.new }

  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#balance' do
    it 'returns the balance' do
      expect(card.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up(1) }.to raise_error 'Error: Maximum balance exceeded'
    end
    
  end
 
end
