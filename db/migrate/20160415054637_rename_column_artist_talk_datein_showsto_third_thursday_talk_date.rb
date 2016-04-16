class RenameColumnArtistTalkDateinShowstoThirdThursdayTalkDate < ActiveRecord::Migration
  def change
  	  	rename_column :shows, :third_thursday_talk_date, :third_thursday_talk_date
  end
end
