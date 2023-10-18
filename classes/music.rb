require_relative 'item'

class MusicAlbum < Item
  attr_accessor :cover_state, :on_spotify

  def initialize(name, publish_date, cover_state, on_spotify, archived: false)
    super(publish_date, archived: archived)
    @id = Random.rand(1..1000)
    @name = name
    @publish_date = format_publish_date(publish_date)
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

  private

  def format_publish_date(date)
    # Check if the date is in the "YYYY-MM-DD" format; if not, format it
    if date.match?(/\A\d{4}-\d{2}-\d{2}\z/)
      date
    else
      # Format the date as "YYYY-MM-DD" or handle any other formatting logic as needed
      # For example, if the date is "03/01/2022," you can format it as follows:
      Date.parse(date).strftime('%Y-%m-%d')
    end
  end
end
