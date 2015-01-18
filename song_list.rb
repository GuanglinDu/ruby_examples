# 2009/06/16 14:37:05
# Implements a SongList Container ''
# See http://stackoverflow.com/questions/12924080/difference-between-instance-variable-and-attr-accessor
# An instance variable is not visible outside the object it is in; but when you create an attr_accessor, it creates an instance variable and also makes it visible (and editable) outside the object.
# Because attr_accessor defines methods, you can call them from outside the class. A @variable is only accessible from inside the class.

class Song
  # 3 accessor methods, getter as in Java, to get 3 instance attributes externally, respectively
  #def name
  #  @name
  #end

  #def artist
  #  @artist
  #end

  #def duration
  #  @duration
  #end

  # Writable attributes (setter as in Java)
  # Defining a method name ending in an equals sign makes that name eligible
  # to appear on the left-hand side of an assignment.
  #def duration(new_duration) #wrong!
  #def duration=(new_duration)
  #  @duration = new_duration
  #end

  # shortcut: attr_reader creates the above 3 accessor methods(getter)
  #attr_reader :name, :artist, :duration
  # the same applies to writable attributes
  #attr_writer :name, :artist, :duration
  # Both reader and writer
  attr_accessor :name, :artist, :duration
  
  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end
  
  # Overrides super's to_s methtod
  def to_s
    "Song: #{@name} -- #{@artist} (#{@duration})"
  end
  
  # Accesses the instance variables by getter/setter
  def access_by_getter
    puts "access_by_getter: #{name}"
  end

  def access_by_setter
      self.name = "access_by_setter"
    puts "access_by_setter: #{name}"
  end
  
end

class SongList
  def initialize
    @songs = Array.new
  end
  
  def append(song)
    @songs.push(song)
    self
  end
  
  def delete_first
    @songs.shift
  end
    
  def delete_last
    @songs.pop
  end
  
  def [](index)
    @songs[index]
  end
  
  # Returns the length of the song list
  def length
    @songs.length
  end
  
  # Returns the song with the provided title, or nil if the entry doesn't exist.
  # This is the ugly implementation
  def with_title(title)
    for i in 0..@songs.length
      return @songs[i] if title == @songs[i].name
    end
  end
    
  def with_title_improved(title)
    @songs.find {|song| title == song.name}
  end
end

# Tests
list = SongList.new
s1 = Song.new('title1', 'artist1', 1)
s2 = Song.new('title2', 'artist2', 2)
s3 = Song.new('title3', 'artist3', 3)
s4 = Song.new('title4', 'artist4', 4)
list.append(s1).append(s2).append(s3).append(s4)

puts list.length
puts list[0..3]

list.delete_first()
puts list.length
puts list[0..3]

title = "title2"
puts "The song named #{title}" + " is " + list.with_title(title).name
puts list.with_title_improved(title).name

# access_by_getter
s1.access_by_getter
s1.access_by_setter
