require 'json'
require_relative '../classes/label'
require_relative 'utils'

module Labels
  include Utils

  def initialize
    @labels_file = 'data/label.json'
    @labels = JSON.parse(File.read(@labels_file)) || []
  end

  def prompt_data(text)
    puts text
    gets.chomp
  end

  def add_label(item)
    title = prompt_data('Add Title: ')
    color = prompt_data('Choose Color: ')

    label = Label.new(title, color)
    label.add_item(item) # Add the item (book) to the label

    # Add the label to the labels array
    @labels << label.to_hash

    # Save the updated labels array to the JSON file
    File.write(@labels_file, JSON.generate(@labels))
    @labels = JSON.parse(File.read(@labels_file))
  end

  def list_label
    if @labels.empty?
      puts 'There are no labels.'
      puts "Please choose an option by entering a number!\n\n"
      return
    end
    @labels.each do |label|
      puts "Title: #{label['title']}, Color: #{label['color']}"
    end
    puts "Please choose an option by entering a number!\n\n"
  end
end
