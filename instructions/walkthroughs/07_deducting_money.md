This challenge is asking us to implement a means to deduct money from the total balance of an Oystercard instance.

- [ ] Write a test for the `deduct` method, see it fail

Similar to adding money to the oyster card, let's start by considering our approach to the problem. The issue is asking for a method called 'deduct'. We also want to be able to specify an amount, so it seems sensible to include an argument. To summarise this into a test that will drive our development, let's start with something like this:

``` ruby
describe Oystercard do
# previous tests hidden for brevity  

  it { is_expected.to respond_to(:deduct).with(1).argument }

end
```

Implement this method in your Oystercard class as described by the test (remember - do no more than necessary to make the test pass), and then let's have a think about how we can actually implement the desired functionality. We want our deduct method to change the value of the balance. As that is our desired outcome, we can use that as our expectation. However, this is a little different to adding, in that we need our test subject to actually have some balance to begin with. There are [4 phases](https://robots.thoughtbot.com/four-phase-test) in creating a test, this would be a part of the setup phase. Your test would look something like this - take time to identify each of the 4 phases (some of them happen implicitly) :

``` ruby
  it 'deducts an amount from the balance' do
    subject.top_up(20)
    expect{ subject.deduct 3}.to change{ subject.balance }.by -3
  end
```

Watch this test fail, and identify what the error message is driving us to do next:

```
Failures:

  1) Oystercard#deduct deducts an amount from the balance
     Failure/Error: expect{ subject.deduct 3}.to change{ subject.balance }.by -3
       expected result to have changed by 3, but was changed by 0
     # ./spec/oystercard_spec.rb:31:in `block (3 levels) in <top (required)>'
```

- [ ] Implement the method, see the test pass

Now we are being driven to actually implement our functionality. This is very similar to the the top_up method:

```ruby
def deduct(amount)
  @balance -= amount
end
```

Now we should have a green test - it is very important that you high-five your pair partner. As always, now is the time to reflect upon your code, and decide if there is anything you would like to refactor. One thing would be to check those respond_to tests - are they still relevant or are they now duplicated? If they are duplicated elsewhere, remove them to keep your code clean and concise.

[Next challenge](../08_touch_in_out.md)
