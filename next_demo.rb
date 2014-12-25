# No continue keyword. Next instead.

for i in 0..5
   if i < 2 then
      next  # no continue in Ruby
   end
   puts "Value of local variable is #{i}"
end

(1..4).each do |x|
  next if x == 2
  puts x
end
