class UpdateLinksDescriptionToText < ActiveRecord::Migration
  def change
    change_column :links, :description, :text, :limit => nil
  end
end
