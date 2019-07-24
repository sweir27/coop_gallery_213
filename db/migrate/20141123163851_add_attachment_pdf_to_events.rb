class AddAttachmentPdfToEvents < ActiveRecord::Migration[4.2]
  def self.up
    change_table :events do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :events, :pdf
  end
end
