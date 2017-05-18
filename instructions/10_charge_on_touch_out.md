# Charging for the journey

[Back to the challenge map](README.md)

When you completed the last challenge, you added the functionality to make sure a card can only be used to touch in if it has enough money for one journey. Now we need to actually charge the card on touch out.

Update the `touch_out` method to reduce the balance by minimum fare.

```
In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card
```

## Learning Objectives covered
- Use RSpec to check that code changes a variable
- Use private methods to maximise encapsulation

## Interview questions you may expect:
- Why would you use curly braces to pass a block of code to the `expect` method in RSpec?

## To complete this challenge:
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] Write a test that uses `expect {}.to change{}.by()` syntax to check that a charge is made on touch out.
- [ ] Update the `touch_out` method to make the test pass
- [ ] Make '#deduct' a private method
- [ ] Keep the code DRY

## Suggested resources
- [Why you should care about
  encapsulation](http://gmoeck.github.io/2011/09/20/why-you-should-care-about-encapsulation.html)
- [expect vs expect with a block on SO](http://stackoverflow.com/questions/19960831/rspec-expect-vs-expect-with-block-whats-the-difference)
- [DRY: Don't Repeat Yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)

## [Walkthrough](walkthroughs/10_charge_on_touch_out.md)
