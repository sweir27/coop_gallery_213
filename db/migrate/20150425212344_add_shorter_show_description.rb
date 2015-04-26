class AddShorterShowDescription < ActiveRecord::Migration
  def change
    add_column :shows, :short_description, :text, limit: 500
  end
end
