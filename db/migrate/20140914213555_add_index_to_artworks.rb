class AddIndexToArtworks < ActiveRecord::Migration
  def change
    add_index :artworks, :user_id
  end
end
