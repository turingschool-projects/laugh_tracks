class CreateSpecials < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.string :name
      t.integer :run_time
      t.references :comedian, foreign_key: true

      t.timestamps
    end
  end
end
