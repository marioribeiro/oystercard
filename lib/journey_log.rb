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

  def finish(exit_station)
    @journey.end_journey(exit_station)
    @journeys << @journey
    @journey = nil
  end

  def current_journey
    @journey ||= @journey_class.new
  end

end