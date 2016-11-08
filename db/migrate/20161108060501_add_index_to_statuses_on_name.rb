class AddIndexToStatusesOnName < ActiveRecord::Migration[5.0]
  def change
    add_index :statuses, :name, unique: true
  end
end
