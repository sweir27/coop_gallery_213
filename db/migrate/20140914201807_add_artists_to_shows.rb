class AddArtistsToShows < ActiveRecord::Migration
  def change
    add_column :shows, :artists, :string
  end
end
