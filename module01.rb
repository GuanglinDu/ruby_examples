# Sep. 9, 2009
# Modules provide namespaces
# Affiliation: Ruby Course — an immersive programming course 
# by Brian Schröder

require_relative 'module02'


module AntGame
  class Ant    
    attr_accessor :x, :y, :direction, :next_action
          
    def initialize(x, y)
      @x = x; @y = y
      @direction = :north
      @next_action = Actions::WAIT # use the module directly here!
    end    
  end
 
  # This module is directly mixed in class Ant (inclue)
  module Actions
    WAIT = :wait
    TURN_LEFT = :turn_left
    TURN_RIGHT = :turn_right
    GO = :go
        
    def create_table01
      puts "Actions::create_table01"
    end    
  end
end


# Module is open. Can be appended as needed!
module AntGame
  def goodbye
    puts "goodbye"
  end
end


# Simulates a migration in Rails
class Migration01 < AntGame::Ant
  def migrate01
    puts "migrate01"
    create_table01
  end
  
  def create_table01
    puts "Creating a table ..."
  end
end

ag1 = AntGame::Ant.new(4, 5)
puts "x, y = #{ag1.x}, #{ag1.y}"
 
include AntGame
ag2 = Ant.new(1, 2)
puts "x, y = #{ag2.x}, #{ag2.y}"

# The module is open, so this new method was appended.
ag2.goodbye

# The module is open
#~ a = 1; b = 2 #can't convert Fixnum into Array (TypeError)
#~ c = ag2.sum(a, b)
c = ag2.sum(1, 2) # sum from module02.rb
puts "a + b = #{c}"

mig = Migration01.new(1, 2)
mig.migrate01
