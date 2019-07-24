class FixCurrentShows < ActiveRecord::Migration[4.2]
  def change
    add_column :shows, :current, :boolean, default: false
    remove_column :shows, :admin, :boolean, default: false
  end
end
