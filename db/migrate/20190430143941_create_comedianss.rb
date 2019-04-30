class CreateComedianss < ActiveRecord::Migration[5.1]
  def change
    create_table :comediansses do |t|
      t.string :name
      t.integer :age
      t.string :city
      t.string :image
    end
  end
end
