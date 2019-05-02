class AddImageToComedians < ActiveRecord::Migration[5.1]
  def change
    add_column :comedians, :image, :string
  end
end
