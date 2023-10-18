def load_genres_from_json
  if File.exist?('./json_files/genres.json')
    genres_data = JSON.parse(File.read('./json_files/genres.json'))
    genres_data.map { |data| Genre.new(data['name']) }
  else
    []
  end
end
