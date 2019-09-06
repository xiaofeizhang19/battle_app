require './lib/game'

describe Game do
  let(:player_1) { double :player }
  let(:player_2) { double :player }
  subject(:game) { described_class.new(player_1, player_2) }

  describe '#initialize' do
    it "retrieve's player 1" do
      expect(game.player_1).to eq(player_1)
    end

    it "retrieve's player 2" do
      expect(game.player_2).to eq(player_2)
    end
  end

  describe '#attack' do
    it 'attack player 2' do
      expect(player_2).to receive(:reduce_hp)
      game.attack(player_2)
    end
  end

  describe '#switch_turns' do
    it 'starts with player 1' do
      expect(game.current_turn).to eq player_1
    end
    
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end

  describe '#game_over?' do
    it 'returns false if no one reaches 0 hit points' do
      allow(player_1).to receive(:lost?).and_return(false)
      allow(player_2).to receive(:lost?).and_return(false)
      expect(game.game_over?).to eq(false)
    end

    it 'returns true if any player reaches 0 hit points' do
      allow(player_1).to receive(:lost?).and_return(true)
      expect(game.game_over?).to eq(true)
    end
  end
end
