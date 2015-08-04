# Module Debug resides in lib directory. 
# 2 steps are needed to mix it in the class.
# Step 1: requires the path
require_relative  'lib/test_module'


class Phonograph
  # Step 2: mixes it into the class by including
  include Debug

  attr_accessor :str
  
  def initialize(name)
    self.str = name
  end
  
  # Overrides Object.to_s
  def to_s
    return str
  end
end


class EightTrack
  include Debug
  
  attr_accessor :str
  
  def initialize(name)
    self.str = name
    do_something # defined in module Debug
  end

  def to_s
    return str
  end

end


ph = Phonograph.new("West End Blues")
puts ph.who_am_i? #"Phonograph (#935520): West End Blues"

et = EightTrack.new("Surrealistic Pillow")
puts et.who_am_i? #"EightTrack (#935500): Surrealistic Pillow"
