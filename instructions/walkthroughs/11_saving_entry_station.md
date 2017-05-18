- [ ] Write a test that expects the card to remember the entry station after the touch in

We need to use a double here to represent a station. Remember to keep doubles as simple as possible:

```ruby
let(:station){ double :station }

it 'stores the entry station' do
  subject.touch_in(station)
  expect(subject.entry_station).to eq station
end
```
- [ ] Update the `touch_in` method to accept the entry station using a double

```ruby
def touch_in(station)
  fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE
  @in_journey = true
end
```

- [ ] Update existing tests to pass a station to the `touch_in` method - you may need to declare your double in a `let` statement at the top of your describe block
- [ ] Expose `entry_station` instance variable using an attribute reader

Some of your tests will fail - go through them and fix them one-by-one, then continue writing code to get 'stores the entry station' test to pass - you will need to update the `@entry_station` variable, and add a public attr_reader.

- [ ] when your tests are all green, refactor to remove the `in_journey` variable. Rewrite the `in_journey?` method to infer its status based on whether or not there is an entry station

```ruby
def in_journey?
  !!entry_station
end
```

- [ ] Make the card forget the entry station on touch out by setting it to `nil`

```ruby
def touch_out
  deduct(MINIMUM_CHARGE)
  @entry_station = nil
end

```

Make sure that all your tests are green and you have looked for opportunities to refactor before moving on to the next challenge.

[Next challenge](../12_journey_history.md)
