class AddQuantityBeforeSaleAndQuantityAfterSaleToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :quantity_before_sale , :integer
    add_column :sales, :quantity_after_sale , :integer
  end
end
