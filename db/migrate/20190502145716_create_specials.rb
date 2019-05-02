class CreateSpecials < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.string :name
      t.integer :runtime_minutes
      t.string :image_url
    end
  end
end
