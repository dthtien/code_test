require 'spec_helper'

RSpec.describe Simulator do
  let(:sim) { Simulator.new }

  it 'places the robot correctly' do
    sim.process('PLACE 1,2,EAST')
    expect(sim.robot.report).to eq('1,2,EAST')
  end

  it 'moves the robot forward' do
    sim.process('PLACE 0,0,NORTH')
    sim.process(Simulator::MOVE)
    expect(sim.robot.report).to eq('0,1,NORTH')
  end

  it 'turns the robot left' do
    sim.process('PLACE 0,0,NORTH')
    sim.process(Simulator::LEFT)
    expect(sim.robot.report).to eq('0,0,WEST')
  end

  it 'turns the robot right' do
    sim.process('PLACE 0,0,NORTH')
    sim.process(Simulator::RIGHT)
    expect(sim.robot.report).to eq('0,0,EAST')
  end

  it 'ignores move that causes falling off the table' do
    sim.process('PLACE 0,0,SOUTH')
    sim.process(Simulator::MOVE)
    expect(sim.robot.report).to eq('0,0,SOUTH')
  end

  it 'handles full command sequence correctly' do
    sim.process('PLACE 1,2,EAST')
    sim.process(Simulator::MOVE)
    sim.process(Simulator::MOVE)
    sim.process(Simulator::LEFT)
    sim.process(Simulator::MOVE)
    expect(sim.process(Simulator::REPORT)).to eq('3,3,NORTH')
  end

  it 'can PLACE again and reset position' do
    sim.process('PLACE 1,2,EAST')
    sim.process(Simulator::MOVE)
    sim.process('PLACE 0,0,SOUTH')
    expect(sim.process(Simulator::REPORT)).to eq('0,0,SOUTH')
  end
end
