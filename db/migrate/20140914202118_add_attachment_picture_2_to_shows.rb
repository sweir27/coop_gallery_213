class AddAttachmentPicture2ToShows < ActiveRecord::Migration[4.2]
  def self.up
    change_table :shows do |t|
      t.attachment :picture_2
    end
  end

  def self.down
    remove_attachment :shows, :picture_2
  end
end
