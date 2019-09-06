class Player
  attr_reader :name, :hit_points
  DEFAULT_HP = 60
  def initialize(name, hit_points = DEFAULT_HP)
    @name = name
    @hit_points = hit_points
  end
  
  def reduce_hp
    @hit_points -= 10
  end

  def lost?
    @hit_points <= 0
  end
end
