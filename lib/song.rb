
require 'pry'
class Song
  #properties of a name and an artist name.
  attr_accessor :name, :artist_name
  #class variable @@all to store all instances for Song 
  @@all = []

#reader
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
#binding.pry

def self.create
  #initializes a song
  #instantiates with .new
  song = self.new
  #saves the song
  #calls the save from def save method
  song.save
  # return the song instance 
  song

end

def self.new_by_name(name)#<= takes in the string name of the song
  #instantiate a song
  song = self.new
  #return a song instance with name set as its name property
  #set the name
  song.name = name
  #return an instance of song
  song
end

def self.create_by_name(name)#<= takes in the string name of the song
  #instantiate a song
  song = self.new
  #return a song instance with name set as its name property
  song.name = name
  #saves the song
  song.save
  #return an instance of song
  song
end

def self.find_by_name(name)
  @@all.find{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
end

def self.alphabetical
  @@all.sort { |a,b| a.name <=> b.name}
#return all songs instances in alphabetical order by song name
#@@all.sort_by{|song| song.name}
end

def self.new_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name= split_filename[1]
    song.artist_name = split_filename[0]
    song
end
def self.create_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name= split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
end

def self.destroy_all
  self.all.clear
end

end
