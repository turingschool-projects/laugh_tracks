class CreateComedians < ActiveRecord::Migration[5.1]
  def change
    create_table :comedians do |t|
      t.string :name
      t.string :age
      t.string :city

      t.timestamps
    end
  end
end
