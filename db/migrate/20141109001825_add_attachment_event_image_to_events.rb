class AddAttachmentEventImageToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :event_image
    end
  end

  def self.down
    remove_attachment :events, :event_image
  end
end
