class AddUserToArtwork < ActiveRecord::Migration[4.2]
  def change
    add_column :artworks, :user_id, :integer
  end
end
