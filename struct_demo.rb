# 2015/01/17 17:10:43
# http://stephaniehoh.github.io/blog/2013/12/28/the-ruby-struct-class/
# According to the official Ruby documentation, a Struct is “a convenient way to bundle a number of attributes together, using accessor methods, without having to write an explicit class.” After playing around with it a bit in pry, it feels like a quick and cheap way to create Class-like instances on the fly that can possess both behaviors and qualities (much like regular Classes).

Person = Struct.new(:name, :age, :gender) do
  def greet_world
    "Hello world, my name is #{name}."
  end

  def ask_question
    "What is your favorite programming language?"
  end
end


stephanie = Person.new("Stephanie", "26", "female")

puts stephanie.name        # => "Stephanie" 
puts stephanie.age           # => "26"
puts stephanie.gender      # => "female"

puts stephanie.greet_world   # => "Hello world, my name is Stephanie."
puts stephanie.ask_question # => "What is your favorite programming language?"



data = [["Stephanie", "female"], ["Matz", "male"], ["Sandi", "female"], ["David", "male"],
["Aaron", "male"]]

class TransparentRoster
  attr_accessor :participants

  def initialize(data)
    @participants = structify(data)
  end

  def sorted_names
    participants.collect { |person| person.name }.sort
  end

  def participant_list
    puts "This year's participants include:"
    sorted_names.each { |name| puts name }
  end

  # here's where we turn the 2D array of data into struct objects

  Person = Struct.new(:name, :gender)

  def structify(data)
    data.collect { |pair| Person.new(pair[0], pair[1]) }
  end

end

tpr = TransparentRoster.new(data)
tpr.sorted_names
tpr.participant_list
