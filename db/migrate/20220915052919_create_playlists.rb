class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
