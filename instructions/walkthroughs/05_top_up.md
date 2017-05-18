This challenge is concerned with updating an object's internal state in a controlled manner, by exposing a public interface to allow the object to respond to external messages. If you are unsure as to why you want to control your public methods, have a look into the concept of 'Encapsulation'. Remember to first of all manually feature test your code in IRB or Pry.

- [ ] Write a test for the `top_up` method

As always, let's start off in the 'Red' phase of our tdd cycle, and write a failing test:

``` ruby
describe Oystercard do
  # previous tests omitted for the sake of brevity

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

  end


end
```

What is going on with this test? This is RSpec's one-liner syntax `is_expected` is synonymous with `expect(subject)`. You can read more about one-liner syntax by searching in the [Relish documentation for RSpec](https://www.relishapp.com/rspec). We are setting the first designs for our method - we have a method name and we know we want a single argument.

If we now run the test, we can see the following failure:

```
Failures:

  1) Oystercard#top_up should respond to #top_up with 1 argument
     Failure/Error: it {is_expected.to respond_to(:top_up).with(1).argument }
       expected #<Oystercard:0x007f8bf29fd8e8 @balance=0> to respond to :top_up with 1 argument
     # ./spec/oystercard_spec.rb:10:in `block (3 levels) in <top (required)>'
```
In oder to make this test pass we need a method by the name of `top_up` that accepts 1 argument:

```
class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)

  end

end
```
Note here that we are not yet doing anything with the amount - we want to do the minimum possible in order to make the test pass. To actually make this useful, we'll want some functionality to add the amount given in the argument to the balance. Let's add another test. When setting the expectation, we want to think about the desired outcome. In this case, we want the balance to increase.

- [ ] Make sure the test fails before implementing the method

``` ruby
describe '#top_up' do

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

end
```


To achieve this checkbox, run RSpec and watch the test fail. Again, this is essential to ensure you have not written a vacuous test (i.e. a test that does not actually test anything and so will always pass).

Once you have read and understood the new test failure, let's implement our functionality.

- [ ] Implement the method to make the test pass


``` ruby
def top_up(amount)
  @balance = @balance + amount
end

```

Your test should now be green - can you think of a way to refactor? (hint: there is a shortcut in ruby `+=` that may make this a little bit more concise.)

[Next challenge](../06_maximum_balance.md)
