class CreateSpecials < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.string :title
      t.integer :run_time
      t.references :comedian, foreign_key: true
    end
  end
end
