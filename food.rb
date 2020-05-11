class Food
  SIZE = 20
  attr_accessor :x, :y

  def initialize
    position_food
  end

  def position_food
    @x = rand * 640 
    @y = rand * 480
  end

  def draw
    Gosu.draw_rect(@x, @y, SIZE, SIZE, Gosu::Color::RED)
  end
end
