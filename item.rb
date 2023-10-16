# item class
class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  @count = 1
  def initialize(date, archived: false)
    @id = self.class.next_id
    @publish_date = date
    @archived = archived
    @genre = nill
    @author = nill
    @label = nill
  end

  def self.next_id
    @count ||= 1
    @count += 1
    @count - 1
  end
end
