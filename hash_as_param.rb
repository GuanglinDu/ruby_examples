# Hash object as param 
# 2013/08/27 11:04:53

#~ def hash_as_param(options = {}) # OK
def hash_as_param(name, age, options = Hash.new) # OK
	puts("name = #{name}, age = #{age}")
	options.each {|key, value| puts "The #{key} is #{value}" }
end

hash_as_param :malei, 28, :precision => 8, :scale => 2, :default => 0

h1 = Hash.new
h1[:action] = 'show' 
h1[:id] = "lijia"
hash_as_param("yr", 26, h1)

