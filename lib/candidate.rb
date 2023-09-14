class Candidate
  attr_reader :name, :party, :votes

  def initialize(candidate_hash)
    @name = candidate_hash[:name]
    @party = candidate_hash[:party]
    @votes = 0
  end

  def vote_for!
    @votes += 1
  end
end