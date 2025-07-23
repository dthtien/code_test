# frozen_string_literal: true

class Position
  attr_reader :x, :y
  attr_accessor :facing

  def initialize(x = 0, y = 0, facing = Direction::NORTH)
    @x = x
    @y = y
    @facing = facing
  end

  def move
    case facing
    when Direction::NORTH then Position.new(x, y + 1, facing)
    when Direction::EAST  then Position.new(x + 1, y, facing)
    when Direction::SOUTH then Position.new(x, y - 1, facing)
    when Direction::WEST  then Position.new(x - 1, y, facing)
    else self
    end
  end
end
