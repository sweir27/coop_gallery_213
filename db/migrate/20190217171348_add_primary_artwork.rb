class AddPrimaryArtwork < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :primary_artwork, references: :artworks, index: true
    add_foreign_key :users, :artworks, column: :primary_artwork_id, on_delete: :nullify
  end
end
