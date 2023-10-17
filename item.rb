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
end
