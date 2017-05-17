
class Journey
  attr_reader :info

  def initialize
    @info = { start: nil, end: nil }
  end

  def start_journey(station)
    @info[:start] = station
  end

  def end_journey(station)
    @info[:end] = station
  end

end
