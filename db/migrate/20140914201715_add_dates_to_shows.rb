class AddDatesToShows < ActiveRecord::Migration
  def change
    add_column :shows, :start_date, :datetime
    add_column :shows, :end_date, :datetime
  end
end
