# Dave Thomas -- Programming-Ruby-1.9&2.0

class Roman
  MAX_ROMAN = 4999

  def initialize(value)
    if value <= 0 || value > MAX_ROMAN # || = or
      fail "Roman values must be > 0 and <= #{MAX_ROMAN}"
    end
    @value = value
  end

  FACTORS = [["m", 1000], ["cm", 900], ["d", 500], ["cd", 400],
					["c", 100], ["xc", 90], ["l", 50], ["xl", 40], ["x", 10],
					["ix", 9], ["v", 5], ["iv", 4], ["i", 1]]

  def to_s
    value = @value
    roman = ""
    
    #sum = 0
    for code, factor in FACTORS
      count, value = value.divmod(factor)
      # See http://www.tutorialspoint.com/ruby/ruby_operators.htm
      # http://stackoverflow.com/questions/9201256/what-does-exactly-do-in-ruby
      #roman << code unless count.zero? # bug-prone
      roman << (code * count) # count*code doesn't work
      
      # Used to understand how this for look works
      #sum += 1
      #puts "#{sum}	#{code},	#{factor},	#{count},	#{value}:	#{roman}"
    end
    
    roman
  end
end

# Tests
#r1 = Roman.new(5000)
#puts r1.to_s
