
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

#build a class finder
def self.find_by_name(name)#<= accepts the string name of the song
  #return matching instance of the song with the string name of the song
  @@all.find{|song| song.name == name}
end

#prevent dulpicate songs being created
def self.find_or_create_by_name(name)#<= accepts the string name of the song
  #either return a matching song instance with that name or create a new song with the name and return the song instance.
  self.find_by_name(name) || self.create_by_name(name)
end

def self.alphabetical
  #returns all the songs in ascending (a-z) alphabetical order.
    @@all.sort_by{|song| song.name} # || @@all.sort { |a,b| a.name <=> b.name}
end

def self.new_from_filename(filename)#<=accepts a filename
  #("Thundercat - For Love I Come.mp3") => ("Thundercat","For Love I Come")
    split_filename = filename.chop.chop.chop.chop.split(" - ")

    song = Song.new
    #return a new song instance with the song name set to new filename
    #[1] is the song name in ("Thundercat - For Love I Come.mp3")
    song.name= split_filename[1]
    #[0] is the artist name in ("Thundercat - For Love I Come.mp3")
    song.artist_name = split_filename[0]
    song
end



#def self.new_from_filename(filename)
+    parts = filename.split(" - ")
+    artist_name = parts[0]
+    song_name = parts[1].gsub(".mp3", "")
+
+    song = self.new
+    song.name = song_name
+    song.artist_name = artist_name
+    song
+  end

def self.create_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    #song = Song.create_from_filename("Thundercat - For Love I Come.mp3")
    song = Song.new
    #expect(song_match.name).to eq("For Love I Come")
    song.name= split_filename[1]
    #expect(song_match.artist_name).to eq("Thundercat")
    song.artist_name = split_filename[0]
    song.save
    song
end

def self.destroy_all
  self.all.clear
end

end
