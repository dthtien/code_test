# frozen_string_literal: true

class Direction
  DIRECTIONS = [
    NORTH = 'NORTH',
    EAST = 'EAST',
    SOUTH = 'SOUTH',
    WEST = 'WEST'
  ].freeze

  def self.left(current)
    DIRECTIONS[(DIRECTIONS.index(current) - 1) % 4]
  end

  def self.right(current)
    DIRECTIONS[(DIRECTIONS.index(current) + 1) % 4]
  end

  def self.valid?(value)
    DIRECTIONS.include?(value)
  end
end


