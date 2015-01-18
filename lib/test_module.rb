module Debug
	def who_am_i?
		"#{self.class.name} (\##{self.object_id}): #{self.to_s}"
	end
	
	def do_something
	  puts "test_module.rb: hi, module."
	end
end
