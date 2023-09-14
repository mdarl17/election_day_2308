require './lib/candidate'

class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(candidate_hash)
    @candidates << Candidate.new(candidate_hash)
    return @candidates.last
  end

end