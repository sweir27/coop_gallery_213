class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_date, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    add_column :events, :url, :string
    add_column :events, :on_homepage, :boolean, default: false
  end
end
