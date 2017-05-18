class Journey
  attr_reader :entry_station, :exit_station

  PENALTY_FARE = 6

  def initialize(entry_station: nil)
    @entry_station = entry_station
    @complete = false
  end

  def exit(station=nil)
    @exit_station = station
    @complete = true
    self
  end

  def fare
    return PENALTY_FARE if penalty?
    zones.inject(:-) + 1
  end

  def complete?
    @complete
  end


  private

  def zones
    [entry_station, exit_station].map(&:zone).sort{|a,b| b <=> a }
  end

  def penalty?
    (!entry_station || !exit_station) 
  end

end
