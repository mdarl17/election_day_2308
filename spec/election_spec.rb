require './lib/election'
require 'pry'

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
  describe '#winners' do
    it 'can return the sole winners of each race' do
      election = Election.new("2024")
      race_1 = Race.new("Texas Governor")
      race_2 = Race.new("U.S. House Rep")
      race_3 = Race.new("U.S. Senator")
      candidate_1 = race_1.register_candidate!({name: "Diana D", party: :democrat})
      candidate_2 = race_1.register_candidate!({name: "Roberto R", party: :republican})
      candidate_3 = race_2.register_candidate!({name: "Mike D", party: :independent})
      candidate_4 = race_2.register_candidate!({name: "John Q", party: :democrat})
      candidate_5 = race_3.register_candidate!({name: "Cancun T", party: :republican})
      candidate_6 = race_3.register_candidate!({name: "Beto O", party: :democrat})
      election.add_race(race_1)
      election.add_race(race_2)
      election.add_race(race_3)

      12.times do 
        candidate_1.vote_for!
      end

      15.times do
        candidate_2.vote_for!
      end

      21.times do
        candidate_3.vote_for!
      end

      21.times do
        candidate_4.vote_for!
      end

      30.times do
        candidate_5.vote_for!
      end

      35.times do
        candidate_6.vote_for!
      end

      # all races still open
      expect(election.winners).to eq([])

      race_1.close!
      race_2.close!

      # race_3 still open, race_2 is tied
      expect(election.winners).to eq([candidate_2])

      race_3.close!
      
      expect(election.winners).to eq([candidate_2, candidate_6])
    end
  end

end