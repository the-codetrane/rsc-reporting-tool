class ChangeCommitteeToSubCommittee < ActiveRecord::Migration[5.0]
  def change
    rename_table :committees, :sub_committees
  end
end
