class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :quantity_before_delivery
      t.integer :quantity_after_delivery

      t.timestamps
    end
  end
end
