require './lib/election'

describe Election do
  describe '#initialize' do
    it 'exists' do
      election = Election.new("2024")
      expect(election).to be_a(Election)
    end
    it 'is created with a `year` attribute' do
      election = Election.new("2024")
      expect(election.year).to eq("2024")
    end
  end
  describe '#add_race' do
    it 'can add a race and keep a record of races' do
      election = Election.new("2024")
      race_1 = Race.new("Texas Governor")
      race_2 = Race.new("U.S. House Rep")
      candidate_1 = race_1.register_candidate!({name: "Diana D", party: :democrat})
      candidate_2 = race_1.register_candidate!({name: "Roberto R", party: :republican})
      candidate_3 = race_2.register_candidate!({name: "Mike D", party: :independent})
      candidate_4 = race_2.register_candidate!({name: "John Q", party: :democrat})
      election.add_race(race_1)
      election.add_race(race_2)
      
      expect(election.races).to eq([race_1, race_2])
      expect(election.candidates).to eq([candidate_1, candidate_2, candidate_3, candidate_4].flatten)
    end
  end
  describe '#vote_counts' do
    it 'keeps a record of each candidate in a race and their respective vote count' do
      election = Election.new("2024")
      race_1 = Race.new("Texas Governor")
      race_2 = Race.new("U.S. House Rep")
      candidate_1 = race_1.register_candidate!({name: "Diana D", party: :democrat})
      candidate_2 = race_1.register_candidate!({name: "Roberto R", party: :republican})
      candidate_3 = race_2.register_candidate!({name: "Mike D", party: :independent})
      candidate_4 = race_2.register_candidate!({name: "John Q", party: :democrat})
      election.add_race(race_1)
      election.add_race(race_2)

      expect(election.vote_counts).to eq({"Diana D" => 0, "Roberto R" => candidate_2.votes, "Mike D" => candidate_3.votes, "John Q" => candidate_4.votes})
    end
  end
end