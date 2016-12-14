class RemoveRetailPriceFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :retail_price
  end
end
