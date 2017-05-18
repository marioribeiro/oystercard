In this challenge, we are being asked to build functionality to track the movements of an Oystercard user.

- [ ] Write tests for `touch_in`, `touch_out` and `in_journey?` methods
- [ ] Write implementation of these methods that will make the tests pass
- [ ] Use an RSpec predicate matcher to check if the card is in use

These methods all share a common feature - they are responsible for tracking when the oyster card is being used. Make this first test pass by defining a touch_in method, then let's think about adding some functionality. We want `touch_in` to change an internal status `in_journey` from false to true. Our first test could look something like this:

```ruby
it 'is initially not in a journey' do
  expect(subject).not_to be_in_journey
end
```

When we run this test we should see the following error:
```
Failures:

  1) Oystercard tracking usage is initially not in use
     Failure/Error: expect(subject).not_to be_in_journey
       expected `#<Oystercard:0x007f9431a830a0 @balance=0>.in_journey?` to return false, got true
     # ./spec/oystercard_spec.rb:7:in `block (3 levels) in <top (required)>'

```
Let's make this pass, remembering to only write the minimum amount of code to change the message.
```ruby
def in_journey?
  false
end
```
Now we need to think about the functionality of our 'touch_in' method. We want this method to mark the card as being in use, so that should form the basis of our expectation:

```ruby

it "can touch in" do
  subject.touch_in
  expect(subject).to be_in_journey
end
```

- [ ] Use an instance variable to track whether the card is in use
- [ ] Use boolean values to store the state of the card

Watch this test fail, then write code that will make this test pass - you will need an instance variable. Once the test is green, look at ways to refactor. You now have 2 tests that require the card to be topped up - refactor these into their own context, with a before block containing `subject.top_up(Oystercard::BALANCE_LIMIT)`.

Once the touch_in method is complete, let's write a test for touch_out:

```ruby
it "can touch out" do
  subject.touch_in
  subject.touch_out
  expect(subject).not_to be_in_journey
end
```

Write code to make this test pass, and then look at ways to refactor.

[Next challenge](../09_min_balance_on_touch_in.md)
