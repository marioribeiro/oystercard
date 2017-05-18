# Calculating the fare between zones

[Back to the challenge map](README.md)

By now your Oystercard application is pretty sophisticated: the card can hold the balance, be touched in and out and remember the history of journeys. You learned a lot although right now it probably all seems very confusing.

Now that we have zone information in the system, it's time to make our fare calculation more sophisticated. At the moment a flat fare (one pound) is charged for any journey, except incomplete ones where the penalty charge is issued (six pounds). However, let's make the fare depend on the number of zones crossed. We will charge £1  for every journey, plus £1 for every zone boundary crossed. So, a journey within the same zone will cost £1, the journey between zones 1 and 2 will cost £2, and the journey between zones 3 and 5 will cost £3. For simplicity sake, assume that the smallest possible number of zones is crossed, e.g. a journey from zone 2 to zone 2 doesn't cross any boundaries (as opposed to, say, going via zone 1).

Update your test suite to check that a correct fare is charged.

```
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## Learning Objectives covered
- Use RSpec to check that code changes a variable
- Use private methods where appropriate
- Calculate an absolute value of a number

## Interview questions you may expect:
- What is refactoring? When do you refactor code?
- What are private methods and why when would you use them?
- Why testing private methods behaviour is different from testing public methods.
- What is an absolute value of a number? How do you calculate it in Ruby? Where is the relevant method defined?
- Everything in Ruby is an object. What does it mean? Where do you find out what methods are available on different objects?

## To complete this challenge:
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] Write tests that cover different scenarios (same zone, different zones)
- [ ] Make the tests pass
- [ ] Consider whether some methods should be private
- [ ] If appropriate, consider extracting some code into new methods to make the code easier to read
- [ ] Implement a mechanism across your application to deduct the penalty fare from the balance if the user forgets to touch out

## Suggested resources:
- [RubyDoc](http://ruby-doc.org/core-2.2.2/)
- [RSpec change matcher](https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/change-matcher)
- [Ruby access control](http://rubylearning.com/satishtalim/ruby_access_control.html)
- [Ruby's Numeric class](http://ruby-doc.org/core-2.2.0/Numeric.html)
- [Parallel assignment on SO](http://stackoverflow.com/questions/2895957/parallel-assignment-operator-in-ruby)

## [Walkthrough](walkthroughs/16_fare_for_zones.md)
