class CreateAlbumFavorites < ActiveRecord::Migration
  def change
    create_table :album_favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
