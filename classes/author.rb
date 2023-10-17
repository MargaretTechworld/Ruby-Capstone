require_relative 'item'

# class Game

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  @count = 1
  def initialize(first_name, last_name)
    @id = self.class.next_id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def self.next_id
    @count ||= 1
    @count += 1
    @count - 1
  end

  def add_item(item)
    item.author = self
    @items << item
  end
end
