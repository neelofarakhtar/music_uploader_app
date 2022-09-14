class AddSearchToMusic < ActiveRecord::Migration[6.0]
  def change
    add_column :musics, :search, :string
  end
end
