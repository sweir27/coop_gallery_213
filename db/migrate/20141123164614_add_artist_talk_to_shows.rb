class AddArtistTalkToShows < ActiveRecord::Migration[4.2]
  def change
    add_column :shows, :third_thursday_talk_title, :string
    add_column :shows, :third_thursday_talk_date, :datetime
  end
end
