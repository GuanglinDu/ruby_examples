# https://www.ruby-forum.com/topic/125685

# May not be faster, but doesn't rely on the ipaddr library
hash = {}
hash["00:19:d2:7b:55:10"] = ["c", "1.12.19.11", 3]
hash["00:18:39:0d:a1:e9"] = ["b", "12.12.19.83", 1]
hash["00:11:50:18:0c:0e"] = ["a", "12.12.19.81", 2]
hash["00:00:00:08:c3:1e"] = ["a", "2.12.19.81", 2]
hash["fe:00:00:08:c6:2a"]  = ["a", "204.12.19.81", 2]
hash["fe:00:00:08:c6:2f"]   = ["a", "204.12.19.81", 2]

# Break the IP addresses into an array of integers
# sort_by will sort by the first entry first, then the second, and so on
sorted_array = hash.sort_by{ |mac, settings|
  settings[1].split('.').map{ |digits| digits.to_i }
}

# Note that you can break apart the array of arrays in the iteration
# And use puts and string interpolation for simpler printing
sorted_array.each { |mac, settings|
   puts "#{mac}, #{settings[1]}"
}

def init_single_vlan()
  addresses = Array.new
  
  addresses.push("192.168.1.101")
  addresses.push("192.168.1.88")
    
  static_ip_start = "192.168.0.0"
  static_ip_end  = "192.168.0.125"
  ip1 = static_ip_start.split('.') # split to a string Array
  ip2 = static_ip_end.split('.')
  (ip1[0].to_i..ip2[0].to_i).each do |i0|
    s0 = i0.to_s + '.'
    (ip1 [1].to_i..ip2[1].to_i).each do |i1|
      s1 = s0 + i1.to_s + '.'
      (ip1 [2].to_i..ip2[2].to_i).each do |i2|
        s2 = s1 + i2.to_s + '.'
        (ip1 [3].to_i..ip2[3].to_i).each do |i3|
          addresses.push(s2 + i3.to_s)
        end
      end
    end
  end
     
  # Swaps 2 addresses
  t = addresses[24]
  addresses[24] = addresses[25]
  addresses[25] = t
  puts
  #addresses.each { |addr| puts "#{addr}" }
  
  addresses = addresses.sort_by do |addr|
    addr.split('.').map{ |digits| digits.to_i }
  end
  
  puts "addresses is type #{addresses.class} "
  addresses.each { |addr| puts "#{addr}" }
end

init_single_vlan
