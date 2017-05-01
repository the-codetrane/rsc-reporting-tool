class RenameCommitteeIdToSubCommitteeIdSubCommitteeReports < ActiveRecord::Migration[5.0]
  def change
    rename_column :sub_committee_reports, :committee_id, :sub_committee_id
  end
end
