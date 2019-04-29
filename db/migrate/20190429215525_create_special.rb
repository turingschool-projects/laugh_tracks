class CreateSpecial < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.string :name
      t.integer :comedianid
      t.string :location
    end
  end
end
