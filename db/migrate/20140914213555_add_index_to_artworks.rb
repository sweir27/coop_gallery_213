class AddIndexToArtworks < ActiveRecord::Migration[4.2]
  def change
    add_index :artworks, :user_id
  end
end
