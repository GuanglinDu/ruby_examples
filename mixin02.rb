# Module Debug resides in lib directory

require_relative  'lib/test_module'


class Phonograph	
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
	end

	def to_s
		return str
	end

end


ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")
puts ph.who_am_i? #"Phonograph (#935520): West End Blues"
puts et.who_am_i? #"EightTrack (#935500): Surrealistic Pillow"
