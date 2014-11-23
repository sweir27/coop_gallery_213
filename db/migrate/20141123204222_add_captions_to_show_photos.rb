class AddCaptionsToShowPhotos < ActiveRecord::Migration
  def change
    add_column :shows, :picture_1_caption, :string
    add_column :shows, :picture_2_caption, :string
  end
end
