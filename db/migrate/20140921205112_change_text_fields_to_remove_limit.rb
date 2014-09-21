class ChangeTextFieldsToRemoveLimit < ActiveRecord::Migration
  def change
    change_column :users, :biography, :text, :limit => nil
    change_column :shows, :description, :text, :limit => nil
  end
end
