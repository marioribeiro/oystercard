require_relative 'journey_log'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :journey_log, :journey

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new(Journey)
    @started = false
    # @journey = Journey.new
  end

  def top_up(amount)
    check_maximum_balance(amount)
    @balance += amount
  end

  def touch_in(station) # TODO: decide how to implement current_journey?
    check_minimum_balance
    @journey_log.start(station)
    # --------------------------------------------------------------------------
    # if in_journey?
    #   save_journey
    #   deduct(journey.fare)
    # end
    # @started = true
    # @journey = journey
    # @journey.start_journey(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    # deduct(@journey_log) TODO: Decide how to pass fare information to deduct method
    # --------------------------------------------------------------------------
    # @journey = Journey.new if !@started
    # @journey.end_journey(station)
    # @started = false
    # save_journey
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

card = Oystercard.new
card.top_up(20)
card.touch_in('a')
card.touch_out('b')
# card.touch_in('c')
# card.touch_out('c')
#
# # puts
# # p card.journey_log
# card.touch_in('c')
# card.touch_in('d')
# p card.journey_log.current_journey
# card.touch_out('e')
# puts
p card.journey_log.fare