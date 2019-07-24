class ChangeDateFormatInMyTable < ActiveRecord::Migration[4.2]
  def up
    change_column :shows, :start_date, :date
    change_column :shows, :end_date, :date
  end

  def down
    change_column :shows, :start_date, :datetime
    change_column :shows, :end_date, :datetime
  end
end
