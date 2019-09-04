require 'player'

describe Player do
  subject(:bob) { Player.new('Bob') }
  subject(:marley) { Player.new('Marley') }

  describe '#name' do
    it 'returns the name' do
      expect(bob.name).to eq('Bob')
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(bob.hit_points).to eq 100
    end
  end


end