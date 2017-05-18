# Checking minimum balance on touch in

[Back to the challenge map](README.md)

Now your Oyster card can be used to touch in and out. However, it will let you touch in even if you haven't got enough funds for a single journey.

If your card is empty, you wouldn't get past the entry barrier on London transport network. This is because when you try to touch in, it checks the balance and refuses to touch in unless you have enough money for one journey.

Let's implement this check. Assume that the minimum fare is £1 and raise an exception unless the balance is at least £1 on touch in.


```
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
```

## Learning Objectives covered
- Raise errors
- Check that a statement raises an error with RSpec
- Use a constant
- Access a constant from outside the class

## Interview questions you may expect:
- What are constants and how are they different from variables? Why use them?
- What are exceptions in Ruby? Why do they have messages associated with them?
- How can you check an expression raises an error with RSpec? Why do you have to pass the code as a block to do this?

## To complete this challenge:
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] Write a test that checks that an error is thrown if a card with insufficient balance is touched in
- [ ] Write the implementation
- [ ] Update existing tests, if necessary, to make sure they still pass
- [ ] Refactor to remove any magic numbers and replace with a constant

## Suggested resources:
- [Handling and Raising exceptions](https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/41-exceptions/lessons/92-handling)
- [raise_error matcher](https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/raise-error-matcher)
- [expect vs expect with a block on SO](http://stackoverflow.com/questions/19960831/rspec-expect-vs-expect-with-block-whats-the-difference)
- [Ruby constants](http://rubylearning.com/satishtalim/ruby_constants.html)
- [If statements](http://www.dev-hq.net/ruby/5--if-statements)

## [Walkthrough](walkthroughs/09_min_balance_on_touch_in.md)
