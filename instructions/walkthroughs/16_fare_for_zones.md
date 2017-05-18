- [ ] Write tests that cover different scenarios (same zone, different zones)
This could look something like this:
```ruby
# spec/journey_spec.rb
context 'given an exit station' do
  let(:other_station) { double :other_station }

  before do
    subject.finish(other_station)
  end

  it 'calculates a fare for zone 1 to zone 1' do
    update_zones(1,1)
    expect(subject.fare).to eq 1
  end

  it 'calculates a fare for zone 1 to zone 2' do
    update_zones(1,2)
    expect(subject.fare).to eq 2
  end

  it 'calculates a fare for zone 6 to zone 5' do
    update_zones(6,5)
    expect(subject.fare).to eq 2
  end

  it 'calculates a fare for zone 6 to zone 1' do
    update_zones(6,2)
    expect(subject.fare).to eq 5
  end

  it "knows if a journey is complete" do
    expect(subject).to be_complete
  end

  def update_zones(entry_zone, exit_zone)
    allow(station).to receive(:zone).and_return(entry_zone)
    allow(other_station).to receive(:zone).and_return(exit_zone)
  end
end
```
- [ ] Make the tests pass
- [ ] Consider whether some methods should be private
- [ ] If appropriate, consider extracting some code into new methods to make the code easier to read
- [ ] Implement a mechanism to deduct the penalty fare from the card if the user forgets to touch out

[Back to README](../README.md)
