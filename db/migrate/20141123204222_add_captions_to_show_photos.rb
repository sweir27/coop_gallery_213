class AddCaptionsToShowPhotos < ActiveRecord::Migration[4.2]
  def change
    add_column :shows, :picture_1_caption, :string
    add_column :shows, :picture_2_caption, :string
  end
end
