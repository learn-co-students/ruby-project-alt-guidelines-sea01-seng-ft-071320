class ChangingIcecreamTableNameAgain < ActiveRecord::Migration[5.2]
  def change
    rename_table :icecreams, :ice_creams
  end
end
