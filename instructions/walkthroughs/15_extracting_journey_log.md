- [ ] test drive the development of JourneyLog class
- [ ] use dependency injection to inject a journey_class
```ruby
class JourneyLog
  def initialize(journey_class: )
    @journey_class = journey_class
    @journeys = []
  end
```
- [ ] `#start` should start a new journey with an entry station
Here is an example of how you might write the tests:

```ruby
require 'journey_log'
describe JourneyLog do

  let(:journey){ double :journey } #this may need to have some methods
  let(:station){ double :station }
  let(:journey_class){double :journey_class, new: journey}
  subject {described_class.new(journey_class: journey_class)}

  describe '#start' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end

    it 'records a journey' do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(station)
      expect(subject.journeys).to include journey
    end
  end
end
  ```

- [ ] a private method `#current_journey` should return an incomplete journey or create a new journey

You could achieve this like so:

```ruby
private
def current_journey
  @current_journey ||= journey_class.new
end
```

- [ ] `#finish` should add an exit station to the `current_journey`.  It should also set the current_journey to `nil` - can you reason why?  Discuss this with your pair partner.
- [ ] `#journeys` should return a list of all previous journeys without exposing the internal array to external modification

The issue with using attr_reader to access an instance variable that is an Array (or other more complex type), is that the attr_reader _returns the actual object_.  Once you have the actual object, you can call any of its methods and potentially change its state in a way that is not consistent with the rules of your domain.  This is very bad.  In the case of an array, you can prevent this by returning a _copy_ of the object using `.dup` like so:
```ruby
def journeys
  @journeys.dup
end
```

- [ ] remove redundant code from OysterCard class

Your Oystercard should now only send messages to the JourneyLog. Although it does pass instances of station around, station is never aware of OysterCard's existence. OysterCard should never communicate directly with Journey.

[Next challenge](../16_fare_for_zones.md)
