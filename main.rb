require './app'

# Ask the user for the choice

class Main
    def menu
      @options = {
        '1' => 'List all games',
        '2' => 'List all books  📚 ',
        '3' => 'List all music albums 🎶',
        '4' => 'List all genres',
        '5' => 'List all labels',
        '6' => 'List all authors',
        '7' => 'Add a book',
        '8' => 'Add a music album',
        '9' => 'Add a game',
        '0' => 'Exit App'
      }

      @options.each do |index, string|
        puts "#{index} - #{string}"
      end
      gets.chomp.to_i
    end

    # handle the choices
def choice(user_answer, response)
    actions = {
      1 => :list_games,
      2 => :list_books,
      3 => :list_music,
      4 => :list_genres,
      5 => :list_labels,
      6 => :list_authors,
      7 => :add_book,
      8 => :add_music_album,
      9 => :add_game,
      0 => :exit_app
    }
  
    if actions.key?(user_answer)
      action = actions[user_answer]
      response.send(action)
    else
      puts 'Invalid option. Please choose a valid option.'
    end
  end

  def main
    response = App.new
  
    loop do
      puts 'WELCOME TO CATALOG OF MY THINGS APP 💁🏿'
      puts 'Choose an option by entering its number'
      user_answer = Main.new.menu
      choice user_answer, response
    end
end