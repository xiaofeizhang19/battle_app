class Game
attr_reader :player_1, :player_2

  def initialize(player_1 = Player.new("Bob"), player_2 = Player.new("Marley"))
    @player_1 = player_1
    @player_2 = player_2
  end


  def attack(player)
    player.reduce_hp
  end
end



