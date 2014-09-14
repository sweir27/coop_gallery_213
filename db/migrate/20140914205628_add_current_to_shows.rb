class AddCurrentToShows < ActiveRecord::Migration
  def change
    add_column :shows, :admin, :boolean, default: false
  end
end
