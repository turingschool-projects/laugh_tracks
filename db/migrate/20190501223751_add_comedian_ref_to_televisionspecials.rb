class AddComedianRefToTelevisionspecials < ActiveRecord::Migration[5.1]
  def change
    add_reference :televisionspecials, :comedian, foreign_key: true
  end
end
