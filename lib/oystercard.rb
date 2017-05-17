require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  attr_reader :balance, :journey_history, :journey

  def initialize
    @balance = 0
    @journey_history = []
    @started = false
    @journey = Journey.new
  end

  def top_up(amount)
    check_maximum_balance(amount)
    @balance += amount
  end

  def touch_in(station, journey = Journey.new)
    check_minimum_balance
    if in_journey?
      save_journey
      deduct(journey.fare)
    end
    @started = true
    @journey = journey
    @journey.start_journey(station)
  end

  def touch_out(station)
    @journey = Journey.new if !@started
    @journey.end_journey(station)
    deduct(journey.fare)
    @started = false
    save_journey
  end

  def in_journey?
    return true if @journey.info[:start] != nil && @journey.info[:end] == nil
    return true if @journey.info[:start] == nil && @journey.info[:end] != nil
    false
  end

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

  def save_journey
    @journey_history << @journey.info
  end
end
