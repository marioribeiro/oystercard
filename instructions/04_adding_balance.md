# Add the balance

[Back to the challenge map](README.md)

By now you have an empty project with a Gemfile and RSpec infrastructure, so you're ready to go. Now it's time to do some actual coding. To complete this issue you'll be required to read and understand quite a lot but all this information is essential to learning how to code at a professional level.

A card that cannot carry a balance is just a piece of plastic (or an empty file, in our case). Let's enable our card to have a balance as the very first step.

Write an RSpec test for the Oystercard class that will test that a freshly initialized card has a `balance` of 0 by default, see it fail, then write an implementation (Oystercard class code) that will make the test pass.


```
In order to use public transport
As a customer
I want money on my card
```


## Learning Objectives covered
- Create a directory
- Create a simple RSpec test
- Use Ruby's `require` method to load external files
- Use RSpec's `describe` method to group tests together
- Use RSpec's expect method to set an expectation
- Use attribute accessors to read an instance variable
- Use `subject` keyword to create a variable to reference the object under test
- Create an Ruby class with an initialize method
- Set an instance variable
- Expose an instance variable using an attribute reader

## Interview questions you may expect:
- What file name conventions Ruby classes use? What happens if the class name is in CamelCase?
- Explain what test-driven development is and what its advantages are.
- Describe the structure of a unit test.
- Discuss good and bad examples of test descriptions
- What are Ruby symbols? How are they different from strings? What are their advantages?
- What is a Ruby class? What is an instance of a class?
- What's a class constructor? What is the `initialize` method? How are they different?

## To complete this challenge:
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] Create a unit test for the `Oystercard` class
- [ ] Write a failing test that checks that a new card has a `balance`
- [ ] Write code that will make this test pass
- [ ] Now refactor by setting the balance in initialize using an instance variable
- [ ] Remove the balance method entirely and replace with an attr_reader

## Suggested resources:
- [RSpec](http://rspec.info/)
- [RSpec basic structure](https://www.relishapp.com/rspec/rspec-core/v/3-3/docs/example-groups/basic-structure-describe-it)
- [Better Specs](http://betterspecs.org/)
- [RSpec resources on Better Specs](http://betterspecs.org/#resources)
- [Ruby's guide to symbols](http://www.troubleshooters.com/codecorn/ruby/symbols.htm)
- [Writing your own classes in Ruby](http://rubylearning.com/satishtalim/writing_our_own_class_in_ruby.html)

## [Walkthrough](walkthroughs/04_adding_balance.md)
