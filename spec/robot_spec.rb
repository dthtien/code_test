# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Robot do
  let(:robot) { Robot.new }

  context '#initialize' do
    it do
      expect(robot.position).to be_a(Position)
      expect(robot.position.x).to eq(0)
      expect(robot.position.y).to eq(0)
      expect(robot.position.facing).to eq(Direction::NORTH)
    end
  end

  context '#place' do
    context 'with valid position' do
      it do
        robot.place(1, 2, Direction::EAST)
        expect(robot.position.x).to eq(1)
        expect(robot.position.y).to eq(2)
        expect(robot.position.facing).to eq(Direction::EAST)
      end
    end

    context 'with invalid position' do
      it do
        robot.place(Table::DEFAULT_SIZE, Table::DEFAULT_SIZE, Direction::NORTH)
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(0)
        expect(robot.position.facing).to eq(Direction::NORTH)
      end
    end

    context 'with invalid direction' do
      it do
        robot.place(1, 2, 'INVALID')
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(0)
        expect(robot.position.facing).to eq(Direction::NORTH)
      end
    end
  end

  context '#move' do
    it 'moves the robot forward' do
      robot.place(0, 0, Direction::NORTH)
      robot.move
      expect(robot.position.x).to eq(0)
      expect(robot.position.y).to eq(1)
      expect(robot.position.facing).to eq(Direction::NORTH)
    end

    it 'does not move the robot off the table' do
      robot.place(0, 0, Direction::SOUTH)
      robot.move
      expect(robot.position.x).to eq(0)
      expect(robot.position.y).to eq(0)
      expect(robot.position.facing).to eq(Direction::SOUTH)
    end
  end

  context '#left' do
    it 'turns the robot left' do
      robot.place(1, 0, Direction::NORTH)
      robot.left
      expect(robot.position.facing).to eq(Direction::WEST)
    end

    it 'does not change position when turning left' do
      robot.place(1, 1, Direction::EAST)
      robot.left
      expect(robot.position.x).to eq(1)
      expect(robot.position.y).to eq(1)
    end
  end

  context '#right' do
    it 'turns the robot right' do
      robot.place(0, 0, Direction::NORTH)
      robot.right

      expect(robot.position.facing).to eq(Direction::EAST)
    end

    it 'does not change position when turning right' do
      robot.place(1, 1, Direction::SOUTH)
      robot.right
      expect(robot.position.x).to eq(1)
      expect(robot.position.y).to eq(1)
    end
  end

  context '#report' do
    it 'reports the current position and facing' do
      robot.place(2, 3, Direction::WEST)
      expect(robot.report).to eq('2,3,WEST')
    end
  end
end
