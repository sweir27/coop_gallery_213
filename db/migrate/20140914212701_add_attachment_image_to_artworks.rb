class AddAttachmentImageToArtworks < ActiveRecord::Migration
  def self.up
    change_table :artworks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :artworks, :image
  end
end
