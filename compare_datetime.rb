# Created on Aug. 19, 2015 Wed.
# Date-time comparison in Ruby
# Package date is in stdlib.

require 'date'

puts "\n--- Compares Dates ---"
# See http://stackoverflow.com/questions/4472851/date-time-comparison-in-ruby
# Date objects
depart_time = DateTime.strptime '23:30', '%H:%M'
arrive_time = DateTime.strptime '02:15', '%H:%M'

# Date objects
arrive_date = depart_date = Date.parse( '2010-12-20' )

arrive_date += 1 if arrive_time.hour < depart_time.hour and arrive_time.hour < 5

puts "Departure Date: #{depart_date} #{depart_time.strftime '%H:%M'}",
  "Arrival Date: #{arrive_date} #{arrive_time.strftime '%H:%M'}"
#=> 2010-12-20 23:30
#=> 2010-12-21 02:15

# See http://stackoverflow.com/questions/992431/comparing-dates-in-rails
# Compares dates only.
#yesterday = Date.new(2015, 8, 18)
yesterday = Date.parse('2015-08-18')
today = Date.today
puts "yesterday: #{yesterday}"
puts "today: #{today}"

if today > yesterday
  puts "today > yesterday"
else
  puts "today < yesterday"
end


# Compares DateTimes ( Common in Rails).
puts "\n--- Compares DateTimes ---"
dt1 = DateTime.new(2015, 8, 19, 14, 5, 6, '+8')
dt2 = DateTime.new(2015, 8, 19, 14, 10, 8, '+8')
puts "dt1 = #{dt1}"
puts "dt2 = #{dt2}"

if dt1 > dt2
  puts "dt1 > dt2"
elsif dt1 == dt2
  puts "dt1 == dt2"
else
  puts "dt1 < dt2"
end
