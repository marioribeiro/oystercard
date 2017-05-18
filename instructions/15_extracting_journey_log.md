# Extracting the journey log out of the Oystercard

[Back to the challenge map](README.md)

So that was fun - we now have a simple station class that can hold information about a station's zone, and a journey class holding the state of each individual journey. We also saw how to extract 1 class into 2 classes, using our tests as a scaffold. Now let's have another look at our Oystercard class and make some improvements. Currently our Oystercard has two responsibilities: maintaining a balance through touch in/out and recording a journey history. We should be following Single Responsibility Principle, so we still have some refactoring to do.

Let's extract a JourneyLog class. It should be responsible for starting a journey, ending a journey and returning a list of journeys.

## Learning Objectives covered
- [ ] Define Dependency Inversion as one of the SOLID principles.

## Interview questions you may expect:
- [ ] Describe one of the SOLID principles.

## To complete this challenge:
- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] test drive the development of `JourneyLog` class
- [ ] Initialize the `JourneyLog` with a `journey_class` parameter (hint: `journey_class` expects an object that knows how to create `Journey`s.  Can you think of an object that already does this?)
- [ ] `#start` should start a new journey with an entry station
- [ ] a private method `#current_journey` should return an incomplete journey or create a new journey
- [ ] `#finish` should add an exit station to the `current_journey`
- [ ] `#journeys` should return a list of all previous journeys without exposing the internal array to external modification
- [ ] remove redundant code from OysterCard class

## Suggested resources: 
- [Ruby](http://www.getlaura.com/dependency-inversion-principle-in-ruby/)

## [Walkthrough](walkthroughs/15_extracting_journey_log.md)
