# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Direction do
  context '.left' do
    it do
      expect(Direction.left(Direction::NORTH)).to eq(Direction::WEST)
      expect(Direction.left(Direction::WEST)).to eq(Direction::SOUTH)
      expect(Direction.left(Direction::SOUTH)).to eq(Direction::EAST)
      expect(Direction.left(Direction::EAST)).to eq(Direction::NORTH)
    end
  end

  context '.right' do
    it do
      expect(Direction.right(Direction::NORTH)).to eq(Direction::EAST)
      expect(Direction.right(Direction::EAST)).to eq(Direction::SOUTH)
      expect(Direction.right(Direction::SOUTH)).to eq(Direction::WEST)
      expect(Direction.right(Direction::WEST)).to eq(Direction::NORTH)
    end
  end

  context '.valid?' do
    it do
      expect(Direction.valid?(Direction::NORTH)).to be_truthy
      expect(Direction.valid?(Direction::EAST)).to be_truthy
      expect(Direction.valid?(Direction::SOUTH)).to be_truthy
      expect(Direction.valid?(Direction::WEST)).to be_truthy
      expect(Direction.valid?('INVALID')).to be_falsy
      expect(Direction.valid?(nil)).to be_falsy
    end
  end
end
