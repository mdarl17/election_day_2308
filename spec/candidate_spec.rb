require './lib/candidate'

describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end
  describe '#initialize' do
    it 'exists' do
      expect(@diana).to be_a(Candidate)
    end
    it 'is created with a name attribute' do
      expect(@diana.name).to eq("Diana D")
    end
    it 'is created with a party attribute' do
      expect(@diana.party).to eq(:democrat)
    end
    it 'is created with a votes attribute set to 0' do
      expect(@diana.votes).to eq(0)
    end
  end
  describe '#vote_for!' do
    it 'can add votes to vote count' do
      @diana.vote_for!
      @diana.vote_for!
      @diana.vote_for!
      expect(@diana.votes).to eq(3)
      @diana.vote_for!
      expect(@diana.votes).to eq(4)
    end
  end
end