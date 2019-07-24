class ChangeDescriptionToText < ActiveRecord::Migration[4.2]
  def change
    change_column :shows, :description, :text
  end
end
