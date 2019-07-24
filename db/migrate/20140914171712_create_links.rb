class CreateLinks < ActiveRecord::Migration[4.2]
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
