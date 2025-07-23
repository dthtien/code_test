#!/usr/bin/env ruby
require_relative '../lib/simulator'

puts "Toy Robot Simulator"
puts "Enter commands (PLACE X,Y,F | MOVE | LEFT | RIGHT | REPORT). Type EXIT or press Ctrl+D to quit."

simulator = Simulator.new

while line = gets
  break if line.strip.upcase == 'EXIT'

  cmd = line.strip.upcase
  simulator.process(cmd)
end

puts "Goodbye!"
