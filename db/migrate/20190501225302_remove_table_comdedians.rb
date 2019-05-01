class RemoveTableComdedians < ActiveRecord::Migration[5.1]
  def change
    drop_table :comdedians
  end
end
