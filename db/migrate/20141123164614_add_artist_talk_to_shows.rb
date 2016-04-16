class AddArtistTalkToShows < ActiveRecord::Migration
  def change
    add_column :shows, :third_thursday_talk_title, :string
    add_column :shows, :third_thursday_talk_date, :datetime
  end
end
