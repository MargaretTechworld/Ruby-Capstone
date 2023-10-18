require 'date'

# item class
class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  @count = 1
  def initialize(date, archived: false)
    @id = self.class.next_id
    @publish_date = date
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
    @publish_date = Date.parse(@publish_date) unless @publish_date.is_a?(Date)
    today = Date.today
    ten_years_ago = (today - (10 * 365))
    @publish_date < ten_years_ago
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
