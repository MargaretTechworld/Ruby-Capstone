class Genre
  attr_accessor :name, :id
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name
    }
  end
end
