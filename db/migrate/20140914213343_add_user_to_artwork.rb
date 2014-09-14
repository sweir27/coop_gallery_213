class AddUserToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :user_id, :integer
  end
end
