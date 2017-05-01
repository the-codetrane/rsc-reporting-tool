class AddEditedByToSubCommitteeReports < ActiveRecord::Migration[5.0]
  def change
    add_column :sub_committee_reports, :edited_by, :string, default: 'N.A.'
  end
end
