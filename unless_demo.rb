# 2015/01/04 10:51:55

a = nil # nil = false, 0 = false
puts "a is nil" unless a

unless a
  puts "This is an unless block"
  puts "with multiple code lines"
end
