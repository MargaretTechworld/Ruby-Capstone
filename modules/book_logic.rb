require 'json'
require_relative '../classes/book'
require_relative 'utils'

module Books
  include Utils

  def initialize
    @book_file = 'data/book.json'
    @books = JSON.parse(File.read(@book_file)) || []
  end

  def prompt_data(text)
    puts text
    gets.chomp
  end

  def add_book
    publisher = prompt_data('Publisher Name: ')
    cover_state = prompt_data('Choose cover state(good/normal/bad): ')
    puts 'add the publish date (yyyy-mm-dd) :'
    publish_date = input_date
    book = Book.new(publisher, publish_date, cover_state)
    add_label(book)
    @books << book.to_h

    File.write(@book_file, JSON.generate(@books))
    @books = JSON.parse(File.read(@book_file))
    puts "Book created successfuly!\n\n"
    puts "Please choose an option by entering a number!\n\n"
  end

  def list_books
    if @books.empty?
      puts 'There are no books.'
      puts "Please choose an option by entering a number!\n\n"
      return
    end
    @books.each do |book|
      puts "
        Title: #{book['title']},
        Publisher: #{book['publisher']},
        Publish date: #{book['publish_date']},
        Cover state: #{book['cover_state']},
        Color: #{book['label_color']}
      "
    end
    puts "Please choose an option by entering a number!\n\n"
  end
end
