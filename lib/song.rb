require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    artist_name, song_name, genre = file_name.split(" - ")

    new_song = self.new(song_name)
    new_artist = Artist.find_or_create_by_name(artist_name)
    
    new_artist.add_song(new_song)
    new_song.artist = new_artist

    new_song
  end
end


# class Song
#   attr_accessor :name, :artist

#   def initialize(name)
#     @name = name
#   end

#   def self.new_by_filename(filename)
#     artist, song = filename.split(" - ")
#     new_song = self.new(song)
#     new_song.artist_name = artist
#     new_song
#   end

#   def artist_name=(name)
#     self.artist = Artist.find_or_create_by_name(name)
#     artist.add_song(self)
#   end
# end