class CreateArtworks < ActiveRecord::Migration[4.2]
  def change
    create_table :artworks do |t|
      t.string :title

      t.timestamps
    end
  end
end
