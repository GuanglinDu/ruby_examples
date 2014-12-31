# http://www.ruby-doc.org/core-2.1.5/Range.html

# prints: 10 11 12 13 14 15
(10..15).each {|n| print n, ' ' }
puts

(10..15).each do |n|
	puts "#{n} "
end

# IP address sequences
static_ip_start = "192.168.0.0"
static_ip_end = "192.168.0.255"

ip1 = static_ip_start.split('.') # string split to string arrays
ip2 = static_ip_end.split('.')
(ip1 [0].to_i..ip2[0].to_i).each do |i0|
	(ip1 [1].to_i..ip2[1].to_i).each do |i1|
		(ip1 [2].to_i..ip2[2].to_i).each do |i2|
			(ip1 [3].to_i..ip2[3].to_i).each do |i3|
				puts i0.to_s << '.' << i1.to_s << '.' << i2.to_s << '.' <<i3.to_s 
			end
		end
	end
end
