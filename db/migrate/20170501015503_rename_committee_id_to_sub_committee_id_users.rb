class RenameCommitteeIdToSubCommitteeIdUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :committee_id, :sub_committee_id
  end
end
