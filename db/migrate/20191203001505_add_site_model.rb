class AddSiteModel < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.timestamps
    end
  end
end
