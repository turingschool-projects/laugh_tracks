class AddUrlPicturePathToComedians < ActiveRecord::Migration[5.1]
  def change
    add_column :comedians, :picurl, :string
  end
end
