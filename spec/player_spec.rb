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
      expect(bob.hit_points).to eq Player::DEFAULT_HP
    end
  end

  describe '#reduce_hp' do
    it 'reduces hit points by 10' do
      expect{bob.reduce_hp}.to change{bob.hit_points}.by(-10)
    end
  end

  describe '#lost?' do
    it 'returns false if a player\' has more than 0 hit points' do
      expect(bob.lost?).to eq(false)
    end

    it 'returns true if a player has 0 hit point' do
      6.times { bob.reduce_hp }
      expect(bob.lost?).to eq(true)
    end
  end

end