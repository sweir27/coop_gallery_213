class ChangeBioToText < ActiveRecord::Migration
  def change
    change_column :users, :biography, :text
  end
end
