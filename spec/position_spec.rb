# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Position do
  context '#initialize' do
    let(:position) { Position.new(1, 2, Direction::NORTH) }

    it do
      expect(position.x).to eq(1)
      expect(position.y).to eq(2)
      expect(position.facing).to eq(Direction::NORTH)
    end
  end

  context '#move' do
    let(:position) { Position.new(1, 2, Direction::NORTH) }

    it 'moves north' do
      new_position = position.move
      expect(new_position.x).to eq(1)
      expect(new_position.y).to eq(3)
      expect(new_position.facing).to eq(Direction::NORTH)
    end

    it 'moves east' do
      position.facing = Direction::EAST
      new_position = position.move
      expect(new_position.x).to eq(2)
      expect(new_position.y).to eq(2)
      expect(new_position.facing).to eq(Direction::EAST)
    end

    it 'moves south' do
      position.facing = Direction::SOUTH
      new_position = position.move
      expect(new_position.x).to eq(1)
      expect(new_position.y).to eq(1)
      expect(new_position.facing).to eq(Direction::SOUTH)
    end

    it 'moves west' do
      position.facing = Direction::WEST
      new_position = position.move
      expect(new_position.x).to eq(0)
      expect(new_position.y).to eq(2)
      expect(new_position.facing).to eq(Direction::WEST)
    end
  end
end
