class AddCriticalBoundaryQuantityToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :critical_quantity_basis, :integer
  end
end
