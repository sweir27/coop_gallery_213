class FixWrongColumns < ActiveRecord::Migration[4.2]
  def change
    add_column :shows, :artists, :string
    add_column :shows, :start_date, :datetime
    add_column :shows, :end_date, :datetime

    remove_column :links, :artists, :string
    remove_column :links, :start_date, :datetime
    remove_column :links, :end_date, :datetime
  end
end
