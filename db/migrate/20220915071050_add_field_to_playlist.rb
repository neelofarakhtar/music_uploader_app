class AddFieldToPlaylist < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :title, :string
    add_column :playlists, :song_link, :string
  end
end
