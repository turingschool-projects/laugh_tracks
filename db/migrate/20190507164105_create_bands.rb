class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :city
      t.integer :age

      t.timestamps
    end
  end
end
