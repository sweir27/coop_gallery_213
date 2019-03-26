class ChangeBioToText < ActiveRecord::Migration[4.2]
  def change
    change_column :users, :biography, :text
  end
end
