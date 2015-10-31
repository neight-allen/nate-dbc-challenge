json.array!(@albums) do |album|
  json.extract! album, :id, :name, :artist_id, :user_id
  json.url album_url(album, format: :json)
end
