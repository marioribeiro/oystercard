The purpose of this challenge is to set an upper limit on the balance of our oyster card. We will do this by adding controls or 'guard clauses' to our top_up method that ensure that the state of an Oystercard instance can only be changed within specified boundaries. Remember to use manual feature testing in IRB or Pry to help keep your focus on the behaviour of the application.

- [ ] Write a test that checks the `top_up` method throws an exception if the new balance would exceed the limit.

This checkbox gives clear directions for the expectation of our test, and thus the design of our method. Let's write a test to check that an exception will be raised.

``` ruby

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error 'Maximum balance exceeded'
  end

```

Running RSpec should now produce a red test.

```
Failures:

  1) Oystercard#top_up raises an error if the maximum balance is exceeded
     Failure/Error: maximum_balance = Oystercard::BALANCE_LIMIT
     NameError:
       uninitialized constant Oystercard::BALANCE_LIMIT
     # ./spec/oystercard_spec.rb:18:in `block (3 levels) in <top (required)>'
```

- [ ] Use a constant to store the limit

Have a read of the test and see if you can do the minimum amount possible to change the error message (hint: you may need to look up 'ruby class constants').

- [ ] Implement the limit in the Oystercard class. Use an inline `if` statement to check if the limit would be exceeded

Once we have assigned the constant, the test message should change to the following:

```
Failures:

  1) Oystercard#top_up raises an error if the maximum balance is exceeded
     Failure/Error: expect{ subject.top_up 1 }.to raise_error 'Maximum balance exceeded'
       expected Exception with "Maximum balance exceeded" but nothing was raised
     # ./spec/oystercard_spec.rb:20:in `block (3 levels) in <top (required)>'
```
This error message is expecting us to raise an error. If we do the minimum to change this error message (i.e just raise an error), we will break the previous tests. In order to raise an error only `if` the maximum balance is exceeded, we will need to introduce a ruby conditional. This is worth researching if you are not sure what that means. To change this error message, your code could look this:
``` ruby
class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

end
```

Our tests should now be green. High five!

Time for a refactor - let's have a think about how we could improve our code. There are some checkboxes in the issue that still need addressing:

- [ ] Make the error message include the limit value
- [ ] Use interpolation to keep your code DRY

Exceptions should be exceptional, so we when we raise an error we need to be really explicit about what is happening - that way future developers can more easily find out why the program is breaking. Let's give more information in our error message to aid in any future debugging. We'll start by refactoring the test.

``` ruby
  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error 'Maximum balance of 20 exceeded'
  end
```

Run this and watch the test turn red, then make it green it by amending the corresponding string in the raised error. Remembering red-green-refactor, consider what happens if we later decide to make the default 200 instead of 20? We would have to search out every mention of 20 in the tests and code, and change it. We can save our future-selves time by DRYing up our code using string interpolation. Your test could look something like this:

``` ruby
it 'raises an error if the maximum balance is exceeded' do
  maximum_balance = Oystercard::MAXIMUM_BALANCE
  subject.top_up maximum_balance
  expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
end
```

This change should not make your test fail - so ensure that you immediately mirror the change in your code. When refactoring like this, it is often wise to 'break' your code to watch the test fail, then make it pass again - this helps to protect against accidentally writing vacuous tests.

[Next challenge](../07_deducting_money.md)
