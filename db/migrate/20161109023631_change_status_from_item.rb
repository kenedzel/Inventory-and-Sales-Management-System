class ChangeStatusFromItem < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :status, :status_id
  end
end
