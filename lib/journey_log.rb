require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :journeys, :journey

  def initialize(journey_class)
    @journeys = []
    @journey_class = journey_class
  end

  def start(entry_station)
    @journey = @journey_class.new
    @journey.start_journey(entry_station)
  end

end