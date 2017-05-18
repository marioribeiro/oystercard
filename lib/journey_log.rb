class JourneyLog
  attr_reader :journey_class, :journeys

  def initialize(journey_class)
    @journeys = []
    @journey_class = journey_class
  end

  def start(entry_station); end

end