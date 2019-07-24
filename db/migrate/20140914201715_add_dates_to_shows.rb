class AddDatesToShows < ActiveRecord::Migration[4.2]
  def change
    add_column :links, :start_date, :datetime
    add_column :links, :end_date, :datetime
  end
end
