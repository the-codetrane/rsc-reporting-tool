class AddDefaultValueForRoleToUser < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :role_id, :integer, default: 5
  end

  def down
    change_column :users, :role_id, :integer, default: nil
  end
end
