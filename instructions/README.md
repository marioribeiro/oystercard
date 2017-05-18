# Oystercard Challenge

This week's challenge will start with going back over the basics we covered last week in Boris Bikes, giving you the chance to reinforce what you learned last week. You'll then be challenged to build a more complex system which should really stretch your skills in Ruby, TDD and object-oriented design.

## Learning objectives

### Goals for the week

Ask yourself the same two questions:

* Are you having fun?

* Are you a better developer than you were yesterday?

#### Primary goal

By the end of the week, the goal is to be able to answer "yes" to the week's primary question:

* **Can you use object-oriented design principles to write better code?**


## Weekly challenge user stories

Here are the user stories you will be working on for this project:

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

### Sequence & Schedule
* [Onsite](../sequence/onsite/week02.md)
* [Remote](../sequence/remote/week02.md)

## Set up the project:

  1. [Create a Gemfile](01_create_gemfile.md)
  2. [Create RSpec conventional files](02_initialize_rspec.md)
  3. [Review debugging basics](03_debugging.md)

## Create a basic Oyster card:
  4. [Add the balance](04_adding_balance.md)
  5. [Enable top up functionality](05_top_up.md)
  6. [Enforce maximum balance](06_maximum_balance.md)
  7. [Deduct the money](07_deducting_money.md)

## Add touch in/out functionality:
  8. [Add touch in/out support](08_touch_in_out.md)
  9. [Checking mininum balance on touch in](09_min_balance_on_touch_in.md)
  10. [Charging for the journey](10_charge_on_touch_out.md)

## Record the journeys
  11. [Saving the entry station](11_saving_entry_station.md)
  12. [Adding journey history](12_journey_history.md)
  13. [Creating the station class](13_create_station_class.md)

## Refactor to extract Journey class
  14. [Handling a journey without a touch out](14_no_touch_in_or_out.md)

## Refactoring: get the code into shape
  15. [Extracting the journey log out of the Oystercard](15_extracting_journey_log.md)

## Make fares depends on zones
  16. [Calculating the fare between zones](16_fare_for_zones.md)

## [Example Code](walkthroughs/example_code)
