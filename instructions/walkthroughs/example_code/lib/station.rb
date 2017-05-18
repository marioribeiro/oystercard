class Station
  attr_reader :name, :zone

  def initialize(name:, zone:)
    @name, @zone = name, zone
  end

end
