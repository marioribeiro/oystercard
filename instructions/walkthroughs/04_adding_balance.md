The main goal of this challenge is to establish a test-first cycle to structure the development of our code. This issue assumes that you have already have a describe block for your Oystercard, and an Oystercard class that has been required into the spec file.

Google 'Red Green Refactor' to see many examples of a TDD coding cycle - in fact, the phrase 'Red Green Refactor' should become a mantra to you during your coding career.

Let's have a look at our first checkboxes:

- [ ] Create a unit test for the `Oystercard` class
- [ ] Write a failing test that checks that a new card has a `balance` of 0

## Phase 1 - red

The first stage in the in the cycle is 'red' - which means we need to see a failing test. In order to see that, we need to write a test and then watch it fail. Your test could look something like this:

``` ruby
require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end
end
```

Now run RSpec from the top level directory of your project. You should see the following error message:
```
Failures:

  1) Oystercard has initial balance
     Failure/Error: expect(subject.balance).to eq 0
     NoMethodError:
       undefined method `balance' for #<Oystercard:0x007fb811106ca8>
     # ./spec/oystercard_spec.rb:5:in `block (2 levels) in <top (required)>'

```

The test is now driving us - it is complaining that there is no method `balance` in our Oystercard class. The trick to successful TDD is to do the minimum required to change the error message - so at this stage, let's just create the method:

``` ruby
class Oystercard
  def balance
  end
end
```

We should now see a new error message - when TDDing, this is an excellent first step towards solving the problem!

```
Failures:

  1) Oystercard has initial balance
     Failure/Error: expect(subject.balance).to eq 0

       expected: 0
            got: nil

       (compared using ==)
     # ./spec/oystercard_spec.rb:5:in `block (2 levels) in <top (required)>'
```

Let's change the message again - it is asking for a return value of 0.

``` ruby
def balance
  0
end
```

## Phase 2 - Green

- [ ] Write code that will make this test pass

Run RSpec again and we will see the test turn green.

```
Oystercard
  has initial balance

Finished in 0.00104 seconds (files took 0.13236 seconds to load)
1 example, 0 failures
```

We are now in the second phase of the `Red Green Refactor` cycle. This is often a high-five moment as it means that the problem you have been working on is finally solved. However this should only be viewed as the first draft - you have grasped the problem in a rudimentary manner, but there is still a lot of work to be done.

## Phase 3 - Refactor

- [ ] Remove the balance method entirely and replace with an attr_reader

So we have solved the problem of the initial balance - however the issue is asking for more. It is looking for an attr_reader to allow access to the instance variable. Note that conventionally an attr_reader/writer/accessor is placed at the top of the class:

``` ruby
class Oystercard

  attr_reader :balance

end

```
That's fine, but if we run RSpec, our test is broken again. This is the reason we get a green test before we refactor - we now need to ensure that the test stays green as we make changes. The test becomes a scaffold for our refactor. Let's fix the test by initializing an oyster card with a balance of zero:

``` ruby
class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

end
```

Our test is now green again and our code is clean.

[Next challenge](../05_top_up.md)
