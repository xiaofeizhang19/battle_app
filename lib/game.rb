require './lib/player'

class Game
attr_reader :player_1, :player_2, :current_turn

  def initialize(player_1 = Player.new("Bob"), player_2 = Player.new("Marley"))
    @player_1 = player_1
    @player_2 = player_2
    @current_turn = @player_1
    @opponent = @player_2
  end

  def attack(player)
    player.reduce_hp
  end

  def opponent
    return @opponent = @player_1 if current_turn == @player_2
    @opponent = @player_2
  end

  def switch_turns
    if @current_turn == @player_1
      @current_turn = @player_2
    else
      @current_turn = @player_1
    end
  end

  def game_over?
    @player_1.lost? || @player_2.lost?
  end

  def loser
    @player_1.lost? ? @player_1 : @player_2
  end
end



