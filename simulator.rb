# frozen_string_literal: true

require_relative "robot.rb"

class Simulator
 attr_accessor :robot

 def initialize
  @robot = Robot.new
 end

 def call
  puts "Enter commands (PLACE X,Y,O, MOVE, LEFT, RIGHT, REPORT). Type 'EXIT' to stop."
  
  loop do
   command = gets.chomp.upcase

   break if command == 'EXIT'

   case command
    when /^PLACE (\d),(\d),([NESW])$/
     x, y, orientation = $1.to_i, $2.to_i, $3
     robot.place(x, y, orientation)
    when 'MOVE'
      robot.move
    when 'LEFT'
      robot.left
    when 'RIGHT'
      robot.right
    when 'REPORT'
      robot.report
   end
  end
 end
end
