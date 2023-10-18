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
  puts "Welcome to the Catalog!\n"
  include MusicLibrary
  def initialize
    @authors = []
    @games = []
    # @genres = load_genres_from_json
    # @albums = load_albums_from_json
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

  # def save_genres_to_json
  #   File.write('./json_files/genres.json', JSON.generate(@genres.map(&:to_hash))) if @genres.size.positive?
  # end

  # exit function
  # def exit_app
  #   save_genres_to_json
  #   save
  #   puts 'Thank you for using this app!'
  #   exit
  # end
  def list_books
    puts 'list book function'
  end

  def list_labels
    puts 'list label function'
  end

  def add_book
    puts 'list add book function'
  end

  # ------- Games and Authors  Methods-------
  def game_details
    puts 'Enter the game details:'
    print 'Title: '
    @title = gets.chomp
    print 'Publish Date (YYYY-MM-DD): '
    @publish_date = gets.chomp
    print 'Multiplayer (yes/no): '
    multiplayer_input = gets.chomp.downcase
    @multiplayer = multiplayer_input == 'yes'
    print 'Last Played Date (YYYY-MM-DD): '
    @last_played_at = gets.chomp
  end

  def authors_details
    print 'Author\'s First Name: '
    @first_name = gets.chomp
    print 'Author\'s Last Name: '
    @last_name = gets.chomp
  end

  def add_game
    game_details
    authors_details
    author = Author.new(@first_name, @last_name)
    game = Game.new(@publish_date, @multiplayer, @last_played_at)
    game.label = @title
    @authors << author
    @games << game
    puts 'Game added successfully.'
    puts 'Author added successfully.'
  end

  def list_games
    puts 'List of Games:'
    @games.each_with_index do |game, index|
      puts "#{index + 1}) #{game.label} (#{game.publish_date.strftime('%Y-%m-%d')})"
    end
  end

  def list_authors
    puts 'List of Authors:'
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def run
    prompt
  end
end
