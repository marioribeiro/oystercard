In this challenge we need to add a guard clause to our touch in method so that you cannot touch in if you do not have the minimum fare available.

- [ ] Write a test that checks that an error is thrown if a card with insufficient balance is touched in

Let's think about what specific behaviour we want to protect against. In this case, we want to check that the balance is greater than 1 before a user is allowed to touch in.

```ruby
it 'will not touch in if below minimum balance' do
  expect{ subject.touch_in }.to raise_error "Insufficient balance to touch in"
end
```

Make sure you put this test in the correct context - you don't want to have any balance on the oystercard.

- [ ] Write the implementation

Write code to make this test pass:

```ruby
def touch_in
  fail "Insufficient balance to touch in" if balance < 1
  @in_journey = true
end
```

- [ ] Update existing tests, if necessary, to make sure they still pass
- [ ] Refactor to remove any magic numbers and replace with a constant

Once all your tests are green, consider a refactor - currently there is a magic number `1` in your touch_in method - this is a [code smell](https://en.wikipedia.org/wiki/Code_smell), as a subsequent developer looking at the code will have to work out what that number means. If the rules change in future, and you want to change the minimum balance to 5, you would have to look in a seemingly unrelated method. Refactor this by using a constant to store the minimum balance.

[Next challenge](../10_charge_on_touch_out.md)
