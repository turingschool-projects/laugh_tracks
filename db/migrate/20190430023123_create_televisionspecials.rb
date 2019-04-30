class CreateTelevisionspecials < ActiveRecord::Migration[5.1]
  def change
    create_table :televisionspecials do |t|
      t.string :name
      t.string :runtime
      t.integer :comedianid

      t.timestamps
    end
  end
end
