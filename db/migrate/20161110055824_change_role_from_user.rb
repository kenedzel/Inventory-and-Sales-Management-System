class ChangeRoleFromUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :role, :role_id
  end
end
