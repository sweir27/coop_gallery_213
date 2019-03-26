class AddVideoLinkToShows < ActiveRecord::Migration[4.2]
  def change
    add_column :shows, :video_link, :string
    add_column :shows, :video_link_title, :string
  end
end
