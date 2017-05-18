This challenge adds another variable to the oystercard class. Too many instance variables are a code smell, but we will start to refactor oystercard in the next challenge.

- [ ] Store the list of journeys as an instance variable and expose it with an attribute reader - you will need to refactor the touch_out method to accept an exit station

Let's start with a test for our touch_out method. Notice that you will need to have two
doubles, one for the entry station and another for our exit station.

```ruby

let(:entry_station) { double :station }
let(:exit_station) { double :station }

it 'stores exit station' do
  subject.touch_in(entry_station)
  subject.touch_out(exit_station)
  expect(subject.exit_station).to eq exit_station
end
```

Making this test pass will break a number of previous tests, so you will need to go through those 1 by 1 and fix them. Once you are back at green, have a look at refactoring your tests - you are now duplicating `subject.touch_in(station)` so maybe you could create a new `context` for an oystercard that is already in a journey.

Now let's store the journeys in an instance variable:

- [ ] Write a test that checks that the card has an empty list of journeys by default

```ruby
it 'has an empty list of journeys by default' do
  expect(subject.journeys).to be_empty
end
```

Make this test pass by exposing the instance variable via a public reader.

- [ ] Use a hash to store one journey (set of an entry and exit stations)
- [ ] Write a test that checks that touching in and out creates one journey

```ruby
let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

it 'stores a journey' do
  subject.touch_in(entry_station)
  subject.touch_out(exit_station)
  expect(subject.journeys).to include journey
end
```
Once you make this test pass, consider refactoring to add a new context for complete journeys.

- [ ] Keep all code including tests DRY

Once your tests are green look at refactoring - do we still need the `@entry_station` and `@exit_station` variables?

[Next challenge](../13_create_station_class.md)
