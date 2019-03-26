class AddPdfTitleToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :pdf_title, :string
  end
end
