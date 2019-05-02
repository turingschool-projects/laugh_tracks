class ChangeAgeTypeInComedians < ActiveRecord::Migration[5.1]
  def change
    change_column :comedians, :age, 'integer USING CAST(age AS integer)'
  end
end
