require './Classes/author'
require './Classes/game'
require './Classes/book'
require './Classes/label'
require './Classes/genre'
require './Classes/music'
require './modules/music_logic'
require 'json'
require './modules/load_genres'

class App
  puts "Welcome to the Catalog!\n\n"
  include MusicLibrary
  def initialize
    @authors = []
    @games = []
    @genres = load_genres_from_json
    @albums = load_albums_from_json
  end

  def list_genres
    if @genres.empty?
      puts 'There are no genres yet'
    else
      @genres.each do |genre|
        puts "Genre ID: #{genre.id}, Name: #{genre.name}"
      end
    end
  end

  def list_music
    if @albums.empty?
      puts 'There are no music albums yet'
    else
      @albums.each do |album|
        puts "Album Name: #{album.name}"
        puts "Publish Date: #{album.publish_date}"
        puts "Cover State: #{album.cover_state}"
        puts "On Spotify: #{album.on_spotify ? 'Yes' : 'No'}"
        puts "Archived: #{album.archived ? 'Yes' : 'No'}"
        puts '---'
      end
    end
  end

  def save_genres_to_json
    File.write('./json_files/genres.json', JSON.generate(@genres.map(&:to_hash))) if @genres.size.positive?
  end

    # exit function
    def exit_app
        save_genres_to_json
        save
        puts 'Thank you for using this app!'
        exit
    end
end
