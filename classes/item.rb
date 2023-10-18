# item class
class Item
  attr_accessor :author, :label, :publish_date, :archived, :name
  attr_reader :genre, :id

  @count = 1
  def initialize(publish_date, archived: false)
    @id = self.class.next_id
    @publish_date = publish_date
    @archived = archived
    @author = nil
    @label = nil
  end

  def genre=(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
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
