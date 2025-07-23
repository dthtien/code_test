# frozen_string_literal: true

class Robot
  attr_reader :position

  def initialize(table = Table.new)
    @table = table
    @position = nil
  end

  def place(x, y, facing)
    return unless Direction.valid?(facing)

    new_pos = Position.new(x.to_i, y.to_i, facing)
    @position = new_pos if @table.valid_position?(new_pos)
  end

  def move
    return unless placed?

    new_pos = @position.move
    @position = new_pos if @table.valid_position?(new_pos)
  end

  def left
    return unless placed?

    @position.facing = Direction.left(@position.facing)
  end

  def right
    return unless placed?

    @position.facing = Direction.right(@position.facing)
  end

  def report
    return unless placed?

    text = "#{@position.x},#{@position.y},#{@position.facing}"
    puts text
    text
  end

  def placed?
    !@position.nil?
  end
end
