class RenameColumnArtistTalkTitleinShowstoThirdThursdayTalkTitle < ActiveRecord::Migration
  def change
  	rename_column :shows, :artist_talk_title, :third_thursday_talk_title
  end
end
