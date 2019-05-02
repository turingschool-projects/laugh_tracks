class AddThumbUrlToSpecial < ActiveRecord::Migration[5.1]
  def change
    add_column :specials, :thumb_url, :string
  end
end
