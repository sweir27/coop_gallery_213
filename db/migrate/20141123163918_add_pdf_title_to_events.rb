class AddPdfTitleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :pdf_title, :string
  end
end
