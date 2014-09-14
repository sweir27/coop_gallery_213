class FixCurrentShows < ActiveRecord::Migration
  def change
    add_column :shows, :current, :boolean, default: false
    remove_column :shows, :admin, :boolean, default: false
  end
end
