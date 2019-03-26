class UpdateLinksDescriptionToText < ActiveRecord::Migration[4.2]
  def change
    change_column :links, :description, :text, :limit => nil
  end
end
