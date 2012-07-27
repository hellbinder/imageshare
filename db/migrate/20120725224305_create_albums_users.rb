class CreateAlbumsUsers < ActiveRecord::Migration
  def up
    create_table :albums_users, :id => false do |t|
      t.references :album, :user
    end
    add_index :albums_users, [:album_id,:user_id]
  end

  def down
    drop_table :albums_users
  end
end
