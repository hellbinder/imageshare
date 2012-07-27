class UsersAlbums < ActiveRecord::Migration
  def up
    create_table :users_albums, :id => false do |t|
      t.references :user, :album
    end
    add_index :users_albums, [:user_id, :album_id]
  end

  def down
    drop_table :users_albums
  end
end
