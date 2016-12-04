class RemoveUnitIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :unit_id
  end
end
