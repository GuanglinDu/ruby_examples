know_ruby = :yes
if know_ruby == :yes
	puts 'You are a Rubyist'
else
	puts "Start learning Ruby"
end

m1 = /Ruby/.match("The future is Ruby")  
puts m1.class  # it returns MatchData  
m2 = "The future is Ruby" =~ /Ruby/  
puts m2          # it returns 14  
