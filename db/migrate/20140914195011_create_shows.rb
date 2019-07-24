class CreateShows < ActiveRecord::Migration[4.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
