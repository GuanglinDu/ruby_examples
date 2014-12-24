# automatically be closed when the block terminates 

in_file_name = "test.txt"
#Check if file exits

if File.exist?(in_file_name)
	puts "File #{in_file_name} exists!"
	File.open(in_file_name, 'r') do |f1|  
		while line = f1.gets  
			puts line
			puts "Class type #{line.class}"
		end
	end  
end  
  
# Create a new file and write to it  
File.open('test2.txt', 'w') do |f2|  
	# use "\n" for two lines of text  
	f2.puts "Created by Satish\nThank God!"  
end 
