# Enable top up functionality

[Back to the challenge map](README.md)

Now that you have a card that can have a balance, you want to make sure it can be topped up.

Write a new test that checks that if a `top_up` method is invoked with the top up value as the argument, the balance of the card will increase by that amount.

```
In order to keep using public transport
As a customer
I want to add money to my card
```

## Learning Objectives covered
- Updating the value of an instance variable
- Using a shorthand notation for addition and assignment in one go
- Using an implicit `return` statement

## Interview questions you may expect:
- When do you have to use a `return` statement in Ruby and when can you omit it?
- What are instance variables and how are they different from local variables?
- How can you access instance variable outside the instance they belong to?
- What is the red/green/refactor cycle? Give me an example of using it.

## To complete this challenge:
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] Write a test for the `top_up` method
- [ ] Make sure the test fails before implementing the method
- [ ] Implement the method to make the test pass

## Suggested resources:
- [RSpec](http://rspec.info/)
- [TDD on Wikipedia](https://en.wikipedia.org/wiki/Test-driven_development)
- [RubyMonk](https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/110-instance-variables)

## [Walkthrough](walkthroughs/05_top_up.md)
