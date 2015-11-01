class CreateAlbumOwnerships < ActiveRecord::Migration
  def change
    create_table :album_ownerships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
