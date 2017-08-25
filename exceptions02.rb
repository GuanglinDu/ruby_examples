# http://rubylearning.com/satishtalim/ruby_exceptions.html

# p043raise.rb  
def raise_exception  
  puts 'I am before the raise.'  
  raise 'An error has occured'
  puts 'I am after the raise'  
end  

raise_exception