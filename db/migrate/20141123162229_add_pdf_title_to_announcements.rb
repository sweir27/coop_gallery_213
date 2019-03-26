class AddPdfTitleToAnnouncements < ActiveRecord::Migration[4.2]
  def change
    add_column :announcements, :pdf_title, :string
  end
end
