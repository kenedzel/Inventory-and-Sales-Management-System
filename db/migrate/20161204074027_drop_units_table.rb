class DropUnitsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :units
  end
end
