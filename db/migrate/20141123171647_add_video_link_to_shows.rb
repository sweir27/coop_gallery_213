class AddVideoLinkToShows < ActiveRecord::Migration
  def change
    add_column :shows, :video_link, :string
    add_column :shows, :video_link_title, :string
  end
end
