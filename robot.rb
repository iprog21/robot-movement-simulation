# frozen_string_literal: true

class Robot
 attr_accessor :x, :y, :orientation
 
 DIRECTIONS = %w(N E S W)
 
 def initialize
  @x           = nil
  @y           = nil
  @orientation = nil
 end

 def left
  turn('left')
 end

 def right
  turn('right')
 end

 def turn(direction)
  return puts "PLACE X,Y,O is required." unless placed?
  
  current_index = DIRECTIONS.index(orientation)

  # The direction N -> E -> S -> W moves clockwise on the Cartesian plane, so apply a positive 1 to move forward.
  # The direction N <- E <- S <- W moves counterclockwise on the Cartesian plane, so apply a negative 1 to move backward.
  offset = direction == 'left' ? -1 : 1

  instance_variable_set("@orientation", DIRECTIONS[(current_index + offset) % 4])
 end

 def move
  return unless placed?

  temp_x = x
  temp_y = y

  # From the Cartesian plane:
  # Moving to N (North); y increases (positive y-direction)
  # Moving to E (East); x increases (positive x-direction)
  # Moving to S (South); y decreases (negative y-direction)
  # Moving to W (West); x decreases (negative x-direction)

  case orientation
   when 'N'
    temp_y += 1
   when 'E'
    temp_x += 1
   when 'S'
    temp_y -= 1
   when 'W'
    temp_x -= 1
  end
  
  return if out_of_bounds?(temp_x, temp_y)
  
  instance_variable_set("@x", temp_x)
  instance_variable_set("@y", temp_y)
 end

 def place(x, y, orientation)
  self.x           = x
  self.y           = y
  self.orientation = orientation
 end

 def report
  return unless placed?

  puts "Output: #{x},#{y},#{orientation}"
 end

 private
  def placed?
   x && y && orientation
  end

  def out_of_bounds?(x, y)
   # so 6x6, will be range from 0 to 5 index from x and y axis
   x < 0 || x >= 6 || y < 0 || y >= 6
  end
end
