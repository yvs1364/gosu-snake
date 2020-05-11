class Snake
  SIZE = 20
  SPEED = 3
  attr_reader :x, :y
  attr_accessor :length, :direction, :score

  def initialize
    @x = 320
    @y = 240
    @vel_x = 0.0
    @vel_y = 0.0
    @score = 0
  end

  def feed(food)
    @score += 1 if  Gosu::distance(@x, @y, food.x, food.y) < 15 
  end

  def turn_left
    @x -= SPEED
  end

  def turn_right
    @x += SPEED
  end

  def move_up
    @y -= SPEED
  end

  def move_down
    @y += SPEED
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    Gosu.draw_rect(@x, @y, SIZE, SIZE, Gosu::Color::WHITE)
  end
end
