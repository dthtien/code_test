# frozen_string_literal: true
require_relative 'table'

class Simulator
  DIRECTIONS = %w[NORTH EAST SOUTH WEST]
  TABLE_SIZE = 5

  attr_reader :x, :y, :facing, :placed

  def initialize
    @placed = false
    @x = nil
    @y = nil
    @facing = nil
  end

  def process(line)
    cmd, args = line.strip.split(' ', 2)

    case cmd
    when 'PLACE'
      place(args)
    when 'MOVE'
      move if placed
    when 'LEFT', 'RIGHT'
      rotate(cmd) if placed
    when 'REPORT'
      return report if placed
    else
      puts "Invalid command: #{cmd}"
    end
    nil
  end

  def place(args)
    x_str, y_str, direction = args.to_s.split(',')
    x = x_str.to_i
    y = y_str.to_i

    if valid_direction?(direction) && valid_position?(x, y)
      @x = x
      @y = y
      @facing = direction
      @placed = true
    end
  end

  def move
    new_x, new_y = move_forward(@x, @y, @facing)
    if valid_position?(new_x, new_y)
      @x, @y = new_x, new_y
    end
  end

  def rotate(turn_direction)
    idx = DIRECTIONS.index(@facing)
    new_idx = turn_direction == 'LEFT' ? (idx - 1) % 4 : (idx + 1) % 4
    @facing = DIRECTIONS[new_idx]
  end

  def report
    text = "#{@x},#{@y},#{@facing}"
    puts text
    text
  end

  private

  def valid_position?(x, y)
    x.between?(0, TABLE_SIZE - 1) && y.between?(0, TABLE_SIZE - 1)
  end

  def valid_direction?(dir)
    DIRECTIONS.include?(dir)
  end

  def move_forward(x, y, facing)
    case facing
    when 'NORTH' then [x, y + 1]
    when 'EAST'  then [x + 1, y]
    when 'SOUTH' then [x, y - 1]
    when 'WEST'  then [x - 1, y]
    end
  end
end
