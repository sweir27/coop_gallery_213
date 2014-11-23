class AddAttachmentPdfToAnnouncements < ActiveRecord::Migration
  def self.up
    change_table :announcements do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :announcements, :pdf
  end
end
