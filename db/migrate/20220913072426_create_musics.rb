class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string :artist_name
      t.string :composer
      t.string :song_file
      t.timestamps
    end
  end
end
