class AddThumbnailToComedians < ActiveRecord::Migration[5.1]
  def change
    add_column :comedians, :thumbnail, :string
  end
end
