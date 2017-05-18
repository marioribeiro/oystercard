require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :journeys, :current_journey

  def initialize(journey_class)
    @journeys = []
    @journey_class = journey_class
  end

  def start(entry_station)
    current_journey
    @current_journey.start_journey(entry_station)
    @journeys << @current_journey
    @current_journey = nil
  end

  def finish(exit_station)
    current_journey
    @journeys.last.end_journey(exit_station)
    @current_journey = nil
  end

  def current_journey
    @current_journey ||= @journey_class.new
  end

  def fare
    return 6 if !@journeys.last.info[:start].nil? && @journeys.last.info[:end].nil?
    return 6 if @journeys.last.info[:start].nil? && !@journeys.last.info[:end].nil?
    return 1 if !@journeys.last.info[:start].nil? && !@journeys.last.info[:end].nil?
    0
  end

end