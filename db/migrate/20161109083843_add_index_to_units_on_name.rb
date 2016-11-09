class AddIndexToUnitsOnName < ActiveRecord::Migration[5.0]
  def change
    add_index :units, :name, unique: true
  end
end
