class AddAttachmentPicture1ToShows < ActiveRecord::Migration[4.2]
  def self.up
    change_table :shows do |t|
      t.attachment :picture_1
    end
  end

  def self.down
    remove_attachment :shows, :picture_1
  end
end
