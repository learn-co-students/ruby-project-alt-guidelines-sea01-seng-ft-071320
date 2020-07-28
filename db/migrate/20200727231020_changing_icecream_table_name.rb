class ChangingIcecreamTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :icecream, :icecreams
  end
end
