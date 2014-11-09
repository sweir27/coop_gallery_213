class ChangeEventLinkName < ActiveRecord::Migration
  def change
    rename_column :events, :event_link, :url
  end
end
