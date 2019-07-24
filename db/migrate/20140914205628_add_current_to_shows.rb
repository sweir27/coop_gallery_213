class AddCurrentToShows < ActiveRecord::Migration[4.2]
  def change
    add_column :shows, :admin, :boolean, default: false
  end
end
