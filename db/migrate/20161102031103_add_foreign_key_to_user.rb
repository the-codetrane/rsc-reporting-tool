class AddForeignKeyToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :group_id
    end
    
    add_foreign_key :users, :groups
  end
end
