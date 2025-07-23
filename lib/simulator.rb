# frozen_string_literal: true
require_relative 'table'
require_relative 'position'
require_relative 'direction'
require_relative 'robot'

class Simulator
  ACTIONS = [
    PLACE = 'PLACE',
    MOVE = 'MOVE',
    LEFT = 'LEFT',
    RIGHT = 'RIGHT',
    REPORT = 'REPORT'
  ].freeze

  attr_reader :robot

  def initialize
    @robot = Robot.new(Table.new)
  end

  def process(line)
    cmd, args = line.strip.split(' ', 2)

    case cmd
    when PLACE
      robot.place(*args.split(','))
    when MOVE
      robot.move
    when LEFT
      robot.left
    when RIGHT
      robot.right
    when REPORT
      robot.report
    else
      puts "Invalid command: #{cmd}"
    end
  end
end
