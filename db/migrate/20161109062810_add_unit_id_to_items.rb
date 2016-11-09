class AddUnitIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :unit_id, :integer
  end
end
