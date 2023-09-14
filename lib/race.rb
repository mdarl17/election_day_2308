require './lib/candidate'

class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate_hash)
    @candidates << Candidate.new(candidate_hash)
    return @candidates.last
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if @open
    # array needed in case of tie
    winner_arr = @candidates.reduce([]) do |cand_arr, cand|
      if cand_arr.length == 0
        cand_arr << cand
      elsif cand.votes > cand_arr[0].votes
        cand_arr[0] = cand
      else
        cand_arr << cand
      end
      cand_arr
    end
    winner_arr.length == 1 ? winner_arr[0] : winner_arr
  end

  def tie?
    winner.class == Array
  end
end