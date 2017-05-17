
class Journey
  attr_reader :info

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @info = { start: nil, end: nil }
  end

  def start_journey(station)
    @info[:start] = station
  end

  def end_journey(station)
    @info[:end] = station
  end

  def fare
    complete_journey? ? MINIMUM_FARE : PENALTY_FARE
  end

  private

  def complete_journey?
    @info[:start] != nil && @info[:end] != nil
  end

end
