class RenameColumnArtistTalkDateinShowstoThirdThursdayTalkDate < ActiveRecord::Migration
  def change
  	  	rename_column :shows, :artist_talk_date, :third_thursday_talk_date
  end
end
