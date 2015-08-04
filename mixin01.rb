# Module Debug mixes in class Phonograph and EightTrack
# who access the module's method!
# This is the way how multiple inhertance is implemented in Ruby.

module Debug
  def who_am_i?
    "#{self.class.name} (\##{self.object_id}): #{self.to_s}"
  end
end


class Phonograph
  # Mixing module Debug into th eclass by including
  # since they're in the same source file
  include Debug

  attr_accessor :str
  
  def initialize(name)
    self.str = name
  end

  def to_s
    return str
  end
end


class EightTrack
  # Ditto
  include Debug
  
  attr_accessor :str
  
  def initialize(name)
    self.str = name
  end

  def to_s
    return str
  end

end

ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")
# Method who_am_i? is mixed in from module Debug
puts ph.who_am_i? #"Phonograph (#935520): West End Blues"
puts et.who_am_i? #"EightTrack (#935500): Surrealistic Pillow"
