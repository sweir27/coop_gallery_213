class AddShorterShowDescription < ActiveRecord::Migration[4.2]
  def change
    add_column :shows, :short_description, :text, limit: 500
  end
end
