# frozen_string_literal: true

class Snake
  SIZE = 20
  attr_reader :x, :y
  attr_accessor :length, :score, :speed

  def initialize
    @x = 320
    @y = 240
    @body = []
    @score = 0
    @length = 1
    @speed = 1
  end

  def feed(food)
    @score += 1 if Gosu.distance(@x, @y, food.x, food.y) < 15
  end

  def turn_left
    @x -= @speed
  end

  def turn_right
    @x += @speed
  end

  def move_up
    @y -= @speed
  end

  def move_down
    @y += @speed
  end

  def move
    @body.unshift([@x, @y])
    @body.pop if @body.size == @length
    @x %= 640
    @y %= 480
  end

  def draw
    Gosu.draw_rect(@x, @y, SIZE, SIZE, Gosu::Color::WHITE)
    @body.each do |body|
      Gosu.draw_rect(body.first, body.last, SIZE, SIZE, Gosu::Color::WHITE)
    end
  end
end
