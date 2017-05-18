# Saving the entry station

[Back to the challenge map](README.md)

Well done for getting this far! By now you have an oyster card that has a balance, can be topped up and touched in, and has a couple of extra features. Let's extend its functionality by adding support for recording journeys.

Our goal is to enable the card to record the entire history of all journeys. However, let's start with a small step: make the card remember the current entry station.

Update your Oystercard class to make the card remember the entry station of the current journey.

```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```

## Learning Objectives covered
- Selectively disable RSpec tests.

## Interview questions you may expect:
- What is the `nil` value in Ruby? How can you check a variable is nil? What happens if nil is used in a conditional expression (`if/unless`)?
- Why would you want to temporarily disable some tests (make them pending)?

## To complete this challenge:
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] Write a test that expects the card to remember the entry station after the touch in
- [ ] Update the `touch_in` method to accept the entry station using a double
- [ ] Update existing tests to pass a station to the `touch_in` method - you may need to declare your double in a `let` statement at the top of your describe block
- [ ] Expose `entry_station` instance variable using an attribute reader
- [ ] Make the card forget the entry station on touch out by setting it to `nil`
- [ ] When your tests are all green, refactor to remove the `in_journey` variable. Rewrite the `in_journey?` method to infer its status based on whether or not there is an entry station

## Suggested resources:
- [Doubles, Mocks, Stubs and Spies](https://github.com/makersacademy/course/blob/master/pills/doubles.md)
- [let and let! in RSpec](https://www.relishapp.com/rspec/rspec-core/v/2-4/docs/helper-methods/let-and-let)
- [True, False and Nil](http://www.skorks.com/2009/09/true-false-and-nil-objects-in-ruby/)
- [Make tests pending in RSpec](https://www.relishapp.com/rspec/rspec-core/v/2-0/docs/pending/pending-examples)
- [Ruby instance variables](https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/110-instance-variables)
- [RSpec predicate matchers](https://www.relishapp.com/rspec/rspec-expectations/v/3-3/docs/built-in-matchers/predicate-matchers)

## [Walkthrough](walkthroughs/11_saving_entry_station.md)
