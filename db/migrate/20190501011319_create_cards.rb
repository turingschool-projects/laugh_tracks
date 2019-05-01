class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cost
      t.string :description

      t.timestamps
    end
  end
end
