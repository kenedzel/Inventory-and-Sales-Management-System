class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :code
      t.integer :category_id
      t.integer :retail_price
      t.integer :cost_price
      t.integer :stock
      t.integer :status

      t.timestamps
    end
  end
end
