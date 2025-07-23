# frozen_string_literal: true

class Table
  DEFAULT_SIZE = 5
  attr_reader :width, :height

  def initialize(width = DEFAULT_SIZE, height = DEFAULT_SIZE)
    @width = width
    @height = height
  end

  def valid_position?(pos)
    pos.x.between?(0, width - 1) && pos.y.between?(0, height - 1)
  end
end
