This challenge adds some simple interaction between internal instance methods.
- [ ] Write a test that uses `expect {}.to change{}.by()` syntax to check that a charge is made on touch out.

```ruby
subject.touch_in
expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
```
- [ ] Update the `touch_out` method to make the test pass

Let's make use of our deduct method to charge the card with the minimum charge.

```ruby
def touch_out
  deduct(MINIMUM_CHARGE)
  @in_journey = false
end
```

Now we are back in the green phase (don't forget to high five!), let's see about refactoring our code.

- [ ] Make '#deduct' a private method

Now we are using our `touch_out` method to deduct from the balance, we are actually testing our `deduct` method implicitly whilst testing `touch_out`. Our `deduct` method is not needed by any other object, so let's move it into private. This helps to keep functionality encapsulated and prevents excessive dependencies from being created in the future. Once you've made a method private, you no longer need to have a test for it as our test for `touch_out` covers the logic in the `deduct` method that we were previously testing, so you should now delete this test.

- [ ] Keep the code DRY

Have a check through your code for any further repetition you can refactor away.

[Next challenge](../11_saving_entry_station.md)
