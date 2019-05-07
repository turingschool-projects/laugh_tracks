class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :track_count
      t.references :band


      t.timestamps
    end
  end
end
