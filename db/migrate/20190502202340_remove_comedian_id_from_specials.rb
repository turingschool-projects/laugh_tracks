class RemoveComedianIdFromSpecials < ActiveRecord::Migration[5.1]
  def change
    remove_column :specials, :comedian_id

  end
end
