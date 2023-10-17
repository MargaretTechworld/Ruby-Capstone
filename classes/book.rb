require_relative 'item'

class Book < Item
  attr_accessor :publisher :cover_state

  def initialize(publish_date, publisher, cover_state, archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || bad_cover_state
  end

  def to_h
    'publish_date' => @publish_date
    'publisher' => @publisher
    'cover_state' => @cover_state
  end

  def bad_cover_state
    @cover_state == 'bad'
  end
end
