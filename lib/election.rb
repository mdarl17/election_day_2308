require './lib/race'
require './lib/candidate'

class Election
  attr_reader :year, :races, :candidates

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
    @races
  end
  
  def candidates
    @races.map do |race|
      race.candidates
    end.flatten
  end

  def vote_counts
    candidates.reduce({}) do |hash, candidate|
      hash[candidate.name] = candidate.votes
      hash
    end
  end

  def winners
    solo_winners = @races.reduce([]) do |winners_arr, race|
      if race.winner && !race.tie?
          winners_arr << race.winner
      end
      winners_arr
    end
    solo_winners
  end
end