require_relative 'item'
require 'date'

# class Game
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.strptime(last_played_at, '%Y-%m-%d')
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
end
