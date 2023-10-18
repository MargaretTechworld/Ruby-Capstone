class MusicAlbum < Item
  attr_accessor :cover_state, :on_spotify

  def initialize(name, publish_date, cover_state, on_spotify, archived: false)
    super(publish_date, archived: archived)
    @id = Random.rand(1..1000)
    @name = name
    @cover_state = cover_state
    @on_spotify = on_spotify
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state,
      'on_spotify' => @on_spotify,
      'archived' => @archived
    }
  end

  def can_be_archived?
    supper && @on_spotify
  end
end
