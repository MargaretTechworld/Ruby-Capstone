# item class
class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  @count = 1
  def initialize(genre, author, source, label, date)
    @id = self.class.next_id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date
  end

  def self.next_id
    @count ||= 1
    @count += 1
    @count - 1
  end

  def archive
    @archived = true
  end

  def unarchive
    @archived = false
  end
end
