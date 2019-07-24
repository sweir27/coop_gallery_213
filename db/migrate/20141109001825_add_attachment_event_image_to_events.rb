class AddAttachmentEventImageToEvents < ActiveRecord::Migration[4.2]
  def self.up
    change_table :events do |t|
      t.attachment :event_image
    end
  end

  def self.down
    remove_attachment :events, :event_image
  end
end
