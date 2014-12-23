#Jun. 13, 2009
#!/usr/bin/ruby

#if statements
def ifDemo(count = 0)
	if count > 10
		puts "Try again"
	elsif count == 3
		puts "You lose"
	else
		puts "Enter a number"
	end
end

def greet(*names)
	case names.length
	when 0
		"How sad, nobody wants to hear my talk."
	when 1
		"Hello #{names}. At least one wants to hear about ruby."
	when 2..5
		"Hello #{names.join(',')}. Good that all of you are interested."
	when 6..12
		"#{names.length} students. Thats perfect. Welcome to ruby!"
	else
		"Wow #{names.length} students. We'll have to find a bigger room."
	end
end

puts greet('Alexander', 'Holger', 'Zyki', 'Sebastian', 'Johann', 'chenkefei', 'JetHoe Tang', 'Matthias', 'oanapop', 'Andrei', 'Phillip')

ifDemo(11)
ifDemo(3)
ifDemo
		
