require './lib/candidate'
require './lib/race'
require 'pry'
require 'pry-nav'

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
  describe '#winner' do
    it 'can return the winner of a CLOSED race OR false (if race open)' do
      race_1 = Race.new("Texas Governor")
      race_2 = Race.new("U.S. House Rep")
      candidate_1 = race_1.register_candidate!({name: "Diana D", party: :democrat})
      candidate_2 = race_1.register_candidate!({name: "Roberto R", party: :republican})
      candidate_3 = race_2.register_candidate!({name: "Mike D", party: :independent})
      candidate_4 = race_2.register_candidate!({name: "John Q", party: :democrat})
      
      12.times do 
        candidate_1.vote_for!
      end

      15.times do
        candidate_2.vote_for!
      end

      10.times do
        candidate_3.vote_for!
      end

      21.times do
        candidate_4.vote_for!
      end

      expect(race_1.winner).to be false
      expect(race_2.winner).to be false

      race_1.close!
      race_2.close!

      expect(race_1.winner).to eq(candidate_2)
      expect(race_2.winner).to eq(candidate_4)
    end
  end
  describe '#tie' do
    it 'can determine if the race ended in a tie' do
      race_1 = Race.new("Texas Governor")
      race_2 = Race.new("U.S. House Rep")
      candidate_1 = race_1.register_candidate!({name: "Diana D", party: :democrat})
      candidate_2 = race_1.register_candidate!({name: "Roberto R", party: :republican})
      candidate_3 = race_2.register_candidate!({name: "Mike D", party: :independent})
      candidate_4 = race_2.register_candidate!({name: "John Q", party: :democrat})
      
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

      expect(race_1.tie?).to be false
      expect(race_2.tie?).to be false

      race_1.close!
      race_2.close!

      expect(race_1.tie?).to be false
      expect(race_2.tie?).to be true
    end
  end
end