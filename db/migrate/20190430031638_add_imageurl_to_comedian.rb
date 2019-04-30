class AddImageurlToComedian < ActiveRecord::Migration[5.1]
  def change
    add_column :comedians, :imageurl, :string
  end
end
