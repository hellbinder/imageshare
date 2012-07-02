class AddAlbumIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :album_id, :int
  end
end
