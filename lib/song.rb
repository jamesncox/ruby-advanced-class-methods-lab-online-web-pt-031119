require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
    
    # @@all.each do |song|
    #   if song.name == name
    #     return song
    #   else
    #     false
    #   end
    # end
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
    
  end
  
  def self.new_from_filename(filename)
     separated = filename.split(" - ")
    artist = separated[0]
    song_title = separated[1].gsub(/.mp3/, "")
    song = self.create
    song.name = song_title
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(filename)
    separated = filename.split(" - ")
    artist = separated[0]
    song_title = separated[1].gsub(/.mp3/, "")
    song = self.create
    song.name = song_title
    song.artist_name = artist
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
