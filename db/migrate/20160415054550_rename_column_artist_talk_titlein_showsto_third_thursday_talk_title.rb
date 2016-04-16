class RenameColumnArtistTalkTitleinShowstoThirdThursdayTalkTitle < ActiveRecord::Migration
  def change
  	rename_column :shows, :third_thursday_talk_title, :third_thursday_talk_title
  end
end
