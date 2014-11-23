class AddPdfTitleToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :pdf_title, :string
  end
end
