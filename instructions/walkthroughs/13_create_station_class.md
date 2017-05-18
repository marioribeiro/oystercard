- [ ] Test drive the creation of a Station class that exposes a name and a zone variable
- [ ] Write a test that checks that the journey now contains information about zones and make it pass
- [ ] Use only one expectation per test. Use multiple `describe` blocks if necessary

An example spec for this may be as follows:

```ruby
require 'station'                                           
describe Station do

  subject {described_class.new(name: "Old Street", zone: 1)}

  it 'knows its name' do                      
    expect(subject.name).to eq("Old Street")              
  end                                                   

  it 'knows its zone' do                                                     
    expect(subject.zone).to eq(1)                                 
  end
end
```
> Getting these tests to pass should be trivial for you by this point, so bonus points if you can figure out a way to generate new stations based on a file of station names and their correct zones (you might consider coming back to this at the end of the challenge).

[Next challenge](../14_no_touch_in_or_out.md)
