require 'spec_helper'

RSpec.describe Simulator do
  let(:sim) { Simulator.new }

  it "ignores commands before PLACE" do
    expect(sim.process("MOVE")).to be_nil
    expect(sim.process("REPORT")).to be_nil
  end

  it "places the robot correctly" do
    sim.process("PLACE 1,2,EAST")
    expect(sim.report).to eq("1,2,EAST")
  end

  it "moves the robot forward" do
    sim.process("PLACE 0,0,NORTH")
    sim.process("MOVE")
    expect(sim.report).to eq("0,1,NORTH")
  end

  it "turns the robot left" do
    sim.process("PLACE 0,0,NORTH")
    sim.process("LEFT")
    expect(sim.report).to eq("0,0,WEST")
  end

  it "turns the robot right" do
    sim.process("PLACE 0,0,NORTH")
    sim.process("RIGHT")
    expect(sim.report).to eq("0,0,EAST")
  end

  it "ignores move that causes falling off the table" do
    sim.process("PLACE 0,0,SOUTH")
    sim.process("MOVE")
    expect(sim.report).to eq("0,0,SOUTH")
  end

  it "handles full command sequence correctly" do
    sim.process("PLACE 1,2,EAST")
    sim.process("MOVE")
    sim.process("MOVE")
    sim.process("LEFT")
    sim.process("MOVE")
    expect(sim.report).to eq("3,3,NORTH")
  end

  it "can PLACE again and reset position" do
    sim.process("PLACE 1,2,EAST")
    sim.process("MOVE")
    sim.process("PLACE 0,0,SOUTH")
    expect(sim.report).to eq("0,0,SOUTH")
  end
end
