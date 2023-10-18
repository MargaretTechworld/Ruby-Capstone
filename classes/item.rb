require 'date'

# item class
class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  @count = 1
  def initialize(publish_date, archived: false)
    @id = self.class.next_id
    @publish_date = DateTime.strptime(publish_date, '%Y-%m-%d')
    @archived = archived
    @genre = nil
    @author = nil
    @label = nil
  end

  def self.next_id
    @count ||= 1
    @count += 1
    @count - 1
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
