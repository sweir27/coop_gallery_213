class AddAttachmentPdfToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :events, :pdf
  end
end
