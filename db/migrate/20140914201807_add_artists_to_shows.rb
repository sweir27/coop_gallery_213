class AddArtistsToShows < ActiveRecord::Migration[4.2]
  def change
    add_column :links, :artists, :string
  end
end
