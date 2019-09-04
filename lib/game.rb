class Game
attr_reader :player_1, :player_2, :current_turn

  def initialize(player_1 = Player.new("Bob"), player_2 = Player.new("Marley"))
    @player_1 = player_1
    @player_2 = player_2
    @current_turn = @player_1
  end


  def attack(player)
    player.reduce_hp
  end

  def switch_turns
    @current_turn = @player_1 ? @player_2 : @player_1
  end
end



