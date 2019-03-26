class CreateAnnouncements < ActiveRecord::Migration[4.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :description
      t.string :announcement_link

      t.timestamps
    end
  end
end
