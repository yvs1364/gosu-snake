require "gosu"
require_relative "snake"
require_relative "food"

class Game < Gosu::Window
  START_SPEED = 0.3
  def initialize
    super 640, 480
    self.caption = "GOSU SNAKE"
    @snake = Snake.new
    @food = Food.new
    @font = Gosu::Font.new(20)
  end

  def update
    snake_move
    reset_food if @snake.feed(@food)
  end

  def draw
    @snake.draw
    @food.draw
    @font.draw_text("Score: #{@snake.score}", 0, 0, 1, 1.0, 1.0, Gosu::Color::YELLOW)
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end

  private

  def snake_move
    @snake.turn_right if button_down? Gosu::KB_RIGHT
    @snake.turn_left if button_down? Gosu::KB_LEFT
    @snake.move_down if button_down? Gosu::KB_DOWN
    @snake.move_up if button_down? Gosu::KB_UP
    @snake.move
  end

  def reset_food
    @food = Food.new
  end
end

Game.new.show
