# Enforce maximum balance

[Back to the challenge map](README.md)

By now you have a card that can be topped up but we want to limit the amount of money that can be stored there. On real Oyster cards the limit is £90, so let's add it to our class too. After you close the issue, it will be impossible to top up the card beyond the limit.

Use test-driven development approach to update the `top_up` method to raise an error if the action would take the card beyond the limit.


```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```

## Learning Objectives covered
- Use interpolation
- Use an inline `if` statement
- Use a constant
- Raise errors
- Access a constant from outside the class
- Check that a statement raises an error with RSpec

## Interview questions you may expect:
- What are exceptions in Ruby? Why do they have messages associated with them?
- How can you check an expression raises an error with RSpec? Why do you have to pass the code as a block to do this?
- What are constants and how are they different from variables? Why use them?
- What does the DRY acronym mean? Why is it important to keep your code DRY?

## To complete this challenge:
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] Write a test that checks the `top_up` method throws an exception if the new balance would exceed the limit.
- [ ] Use a constant to store the limit
- [ ] Implement the limit in the top_up method. Use an inline `if` statement to check if the limit would be exceeded
- [ ] Make the error message include the limit value
- [ ] Use interpolation to keep your code DRY

## Suggested resources:
- [Handling and Raising exceptions](https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/41-exceptions/lessons/92-handling)
- [raise_error matcher](https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/raise-error-matcher)
- [expect vs expect with a block on SO](http://stackoverflow.com/questions/19960831/rspec-expect-vs-expect-with-block-whats-the-difference)
- [Ruby constants](http://rubylearning.com/satishtalim/ruby_constants.html)
- [If statements](http://www.dev-hq.net/ruby/5--if-statements)
- [String interpolation](https://rubymonk.com/learning/books/1-ruby-primer/chapters/5-strings/lessons/31-string-basics)
- [DRY: Don't Repeat Yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)

## [Walkthrough](walkthroughs/06_maximum_balance.md)
