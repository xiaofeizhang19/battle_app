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


end
