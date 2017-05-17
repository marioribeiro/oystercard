require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  attr_reader :balance, :journey_history, :journey

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    check_maximum_balance(amount)
    @balance += amount
  end

  def touch_in(station, journey = Journey.new)
    check_minimum_balance
    @journey = journey
    @journey.start_journey(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey.end_journey(station)
    @journey_history << @journey.info
  end

  # def in_journey?
  #   return false if journey_history.empty?
  #   @journey_history.last[:exit_station].nil?
  # end

  private

  def deduct(amount)
    @balance -= amount
  end

  def check_maximum_balance(amount)
    fail "Error: Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
  end

  def check_minimum_balance
    fail "Error: You need to top up" if @balance < MINIMUM_BALANCE
  end
end
