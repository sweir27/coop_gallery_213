class AddArtistTalkToShows < ActiveRecord::Migration
  def change
    add_column :shows, :artist_talk_title, :string
    add_column :shows, :artist_talk_date, :datetime
  end
end
