# module A::B::C # illegal if module A, B and C do not exist yet
module A
module B
module C	
  def C::greet
    puts "I'm method greet"
  end
end
end
end

A::B::C::greet
