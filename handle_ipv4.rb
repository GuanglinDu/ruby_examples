# Created on Jun. 2, 2016 Thu.

# TODO: only IPv4 is supported. How to support IPv6?
# Fortunately, testing data is not much, and only a few records will do.
def create_ip_address(num1=1)
  #ip_start = @vlan.static_ip_start.split(".") # Array
  ip_start = "192.168.0.0".split(".")
  index = ip_start.length - 1
  num2 = ip_start[index].to_i + num1
  ip_start[index] = num2.to_s

  ip = ""
  length = ip_start.length - 1
  ip_start.each_with_index do |elem, index|
    index < length ? ip += elem + "." : ip += elem
  end
  puts ip
end

create_ip_address
create_ip_address 2

