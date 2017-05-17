
class Journey
  attr_reader :info

  def initialize
    @info = { start: nil, end: nil }
  end

  def start_journey(station)
    @info[:start] = station
  end

  def end_journey(station)
    # if start = nil do penalty fare and terminate journey
    # if start = true do normal fare calculation and terminate journey
    @info[:end] = station
  end

end
