require './lib/candidate'
require './lib/race'

describe Race do
  describe '#initialize' do
    it 'exists' do
      race = Race.new("Texas Governor")
      expect(race).to be_a(Race)
    end
    it 'is created with the office being voted on in the Race' do
      race = Race.new("Texas Governor")
      expect(race.office).to eq("Texas Governor")
    end
  end
  describe '#register_candidate!' do
    it 'registers candidates in a race' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
    end
    it 'keeps a record of candidates in the race' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      expect(race.candidates).to eq([candidate1, candidate2])
    end
  end
end