class Player
  attr_reader :name, :hit_points

  def initialize(name, hit_points = 100)
    @name = name
    @hit_points = hit_points
  end

  #def attack(player)
  #  player.reduce_hp
  #end
  
  def reduce_hp
    @hit_points -= 10
  end

end