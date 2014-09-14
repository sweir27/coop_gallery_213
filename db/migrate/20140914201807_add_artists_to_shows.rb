class AddArtistsToShows < ActiveRecord::Migration
  def change
    add_column :links, :artists, :string
  end
end
