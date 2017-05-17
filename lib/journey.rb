
class Journey

  attr_reader :travelling

  def initialize
    @travelling = false
  end

  def start_journey(station)
    @travelling = true
    @start_station = station
  end

  def end_journey(station)
    @travelling = false
    @end_station = station
  end

end
