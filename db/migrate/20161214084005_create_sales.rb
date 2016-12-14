class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :total_sale

      t.timestamps
    end
  end
end
