require './loaders'
require './Classes/author'
require './Classes/game'
require './Classes/book'
require './Classes/label'
require './Classes/genre'
require './Classes/music'
require 'json'

class App
    puts "Welcome to the Catalog!\n\n"

    def initialize
        @authors = []
        @games = []
        @books = load_books
        @labels = load_labels
        @genres = load_genres_from_json
        @albums = load_albums_from_json
    end
end