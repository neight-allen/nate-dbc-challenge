class CreateArtistFavorites < ActiveRecord::Migration
  def change
    create_table :artist_favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.references :artist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
